import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:internship_app/core/utils/notification_helper.dart';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:internship_app/core/services/service_locator.dart';
import 'package:internship_app/core/utils/siswa_manager.dart';
import 'package:internship_app/core/utils/token_manager.dart';

typedef OnMessageCallback = Future<void> Function(Map<String, dynamic> data);
typedef OnJoinCallback = void Function(String name);
typedef OnLeaveCallback = void Function(String name);

class WebSocketService {
  WebSocketChannel? _channel;

  Stream<dynamic>? get stream => _channel?.stream;
  WebSocketChannel? get channel => _channel;

  Future<void> connectPresenceChannel({
    required int roomId,
    required OnMessageCallback onMessage,
    required OnJoinCallback onJoin,
    required OnLeaveCallback onLeave,
  }) async {
    const host = 'dash.intern.tik.unej.ac.id';
    const appKey = 'wxchwyrzgjxjax9qvx5a';
    // const appKey = '12345';
    const authUrl = 'https://$host/api/broadcasting/auth';

    const wsUrl =
        'wss://$host/app/$appKey?protocol=7&client=flutter&version=1.0';

    final siswa = await sl<SiswaManager>().getSiswa();
    final token = await sl<TokenManager>().getToken();

    if (siswa == null || token == null) {
      log('[WS] Siswa atau token tidak tersedia');
      return;
    }

    final presenceChannel = 'presence-room-tasks.$roomId';
    log('[WS] Connecting to channel: $presenceChannel');

    _channel = WebSocketChannel.connect(Uri.parse(wsUrl));
    _channel!.stream.listen(
      (event) async {
        try {
          final parsed = jsonDecode(event);
          final eventName = parsed['event'] as String?;
          final channel = parsed['channel'] as String?;
          final data = parsed['data'] as String?;

          if (eventName == null) {
            log('[WS] Event name null, skipping...');
            return;
          }

          switch (eventName) {
            case 'pusher:ping':
              _channel!.sink.add(jsonEncode({'event': 'pusher:pong'}));
              break;

            case 'pusher:connection_established':
              final socketId = jsonDecode(data!)['socket_id'];
              final authResponse = await http.post(
                Uri.parse(authUrl),
                headers: {
                  'Authorization': 'Bearer $token',
                  'Accept': 'application/json',
                  'Content-Type': 'application/json',
                },
                body: jsonEncode({
                  'channel_name': presenceChannel,
                  'socket_id': socketId,
                }),
              );

              if (authResponse.statusCode == 200) {
                final authData = jsonDecode(authResponse.body);
                final subscribePayload = {
                  'event': 'pusher:subscribe',
                  'data': {
                    'channel': presenceChannel,
                    'auth': authData['auth'],
                    if (authData.containsKey('channel_data'))
                      'channel_data': authData['channel_data'],
                  },
                };
                _channel!.sink.add(jsonEncode(subscribePayload));
                log('[WS] Subscribed to $presenceChannel');
              } else {
                log('[WS] Auth failed: ${authResponse.body}');
              }
              break;

            case 'pusher-internal:member_added':
              if (data != null) {
                final user = jsonDecode(data);
                onJoin(user['user_id'] ?? 'Unknown');
              }
              break;

            case 'pusher-internal:member_removed':
              if (data != null) {
                final user = jsonDecode(data);
                log(data);
                await showNotification('test', 'member leaved');
                onLeave(user['user_id'] ?? 'Unknown');
              }
              break;

            default:
              if (channel == presenceChannel && data != null) {
                final payload = jsonDecode(data);

                log('[WS] Message payload: $payload');
                log('[notification] ${payload['title']}');
                // await showNotification(payload['title'] ?? 'Task Baru',
                //     payload['message'] ?? 'Pesan tidak tersedia');

                onMessage(payload);
              }
          }
        } catch (e, stackTrace) {
          log('[WS] Error processing event: $e', stackTrace: stackTrace);
        }
      },
      onDone: () => log('[WS] Connection closed'),
      onError: (error) => log('[WS] Connection error: $error'),
      cancelOnError: true,
    );
  }

  void disconnect() {
    _channel?.sink.close();
    _channel = null;
    log('[WS] Disconnected');
  }
}
