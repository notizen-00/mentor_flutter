import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:internship_app/core/services/service_locator.dart';
import 'package:internship_app/core/utils/notification_helper.dart';
import 'package:internship_app/core/utils/siswa_manager.dart';
import 'package:internship_app/core/utils/token_manager.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

Future<void> connectToPusher() async {
  const reverbHost = 'dash.intern.tik.unej.ac.id';
  const reverbAppKey = 'wxchwyrzgjxjax9qvx5a';
  // const reverbAppKey = '12345';
  const wsUrl = 'wss://$reverbHost/app/$reverbAppKey';
  const broadcastAuthUrl = 'https://$reverbHost/api/broadcasting/auth';

  final token = await sl<TokenManager>().getToken();
  final siswa = await sl<SiswaManager>().getSiswa();

  if (token == null || siswa == null) {
    log('[Pusher] Token atau siswa tidak tersedia!');
    return;
  }

  final privateChannel = 'private-tasks.${siswa.id}';
  const publicChannel = 'public-task';
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

            final subscribePublic = {
              'event': 'pusher:subscribe',
              'data': {'channel': publicChannel}
            };

            channel.sink.add(jsonEncode(subscribePublic));

            channel.sink.add(jsonEncode(subscribePayload));
            log('[Pusher] Subscribed to $privateChannel');
          } else {
            log('[Pusher] Auth failed: ${response.body}');
            channel.sink.close();
          }
        }

        // Jika pesan dari channel private
        if (parsed['channel'] == privateChannel) {
          final rawData = parsed['data'];
          final data = jsonDecode(rawData);
        }

        if (parsed['event'] == 'event.task' &&
            parsed['channel'] == 'public-task') {
          final rawData = parsed['data'];

          late Map<String, dynamic> data;

          if (rawData is Map<String, dynamic>) {
            data = rawData;
          } else if (rawData is String) {
            data = jsonDecode(rawData);
          } else {
            log('[Pusher] Unexpected data format: $rawData');
            return;
          }

          log('[Pusher] Parsed Data: $data');

          final title = data['title'] ?? 'Informasi';
          final message = data['description'] ?? 'Pesan tidak tersedia';

          await showNotification('Task Baru: $title', message);
        }

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
