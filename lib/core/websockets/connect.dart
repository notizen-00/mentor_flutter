import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:internship_app/core/services/service_locator.dart';
import 'package:internship_app/core/utils/siswa_manager.dart';
import 'package:internship_app/core/utils/token_manager.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

Future<void> connectToPusher() async {
  const reverbHost = '10.10.10.194';
  const reverbAppKey = 'wxchwyrzgjxjax9qvx5a';
  const wsUrl = 'ws://$reverbHost:8080/app/$reverbAppKey';
  const broadcastAuthUrl = 'http://$reverbHost/api/broadcasting/auth';

  final token = await sl<TokenManager>().getToken();
  final siswa = await sl<SiswaManager>().getSiswa();

  if (token == null || siswa == null) {
    log('[Pusher] Token atau siswa tidak tersedia!');
    return;
  }

  final privateChannel = 'private-tasks.${siswa.id}';
  log('[Pusher] Connecting to channel: $privateChannel');

  final channel = WebSocketChannel.connect(Uri.parse(wsUrl));

  log('$channel');

  channel.stream.listen(
    (message) async {
      log('[Pusher] Message: $message');

      try {
        final parsed = jsonDecode(message);

        // Pusher ping -> respond with pong
        if (parsed['event'] == 'pusher:ping') {
          channel.sink.add(json.encode({"event": "pusher:pong"}));
          log('[Pusher] Sent pong');
        }

        // Saat koneksi berhasil dan kita mendapatkan socket_id
        if (parsed['event'] == 'pusher:connection_established') {
          final connectionData = jsonDecode(parsed['data']);
          final socketId = connectionData['socket_id'];
          log('[Pusher] Connected with socket_id: $socketId');

          // Kirim request auth ke backend
          final response = await http.post(
            Uri.parse(broadcastAuthUrl),
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
            body: jsonEncode({
              'channel_name': privateChannel,
              'socket_id': socketId,
            }),
          );

          if (response.statusCode == 200) {
            final authData = jsonDecode(response.body);
            final authToken = authData['auth'];

            final subscribePayload = {
              'event': 'pusher:subscribe',
              'data': {
                'channel': privateChannel,
                'auth': authToken,
              }
            };

            channel.sink.add(jsonEncode(subscribePayload));
            log('[Pusher] Subscribed to $privateChannel');
          } else {
            log('[Pusher] Auth failed: ${response.body}');
            channel.sink.close();
          }
        }

        // Jika pesan dari channel private
        if (parsed['channel'] == privateChannel) {}

        // Jika ada error dari pusher
        if (parsed['event'] == 'pusher:error') {
          log('[Pusher] ERROR: ${parsed['data']}');
        }
      } catch (e) {
        log('[Pusher] Error parsing message: $e');
      }
    },
    onDone: () {
      log('[Pusher] Connection closed.');
    },
    onError: (error) {
      log('[Pusher] Error: $error');
    },
  );
}
