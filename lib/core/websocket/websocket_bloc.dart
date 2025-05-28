import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

part 'websocket_event.dart';
part 'websocket_state.dart';

class WebsocketBloc extends Bloc<WebsocketEvent, WebsocketState> {
  final WebSocketChannel channel;
  final FlutterLocalNotificationsPlugin notificationsPlugin;

  late final StreamSubscription _subscription;

  WebsocketBloc({required this.channel, required this.notificationsPlugin})
      : super(WebsocketInitial()) {
    _subscription = channel.stream.listen(
      (data) {
        add(WebsocketMessageReceived(data.toString()));
      },
      onError: (error) {
        // Emit error state jika perlu
        // add(WebsocketErrorOccurred(error.toString()));
        log('WebSocket: Error $error');
      },
      onDone: () {
        // Emit disconnect atau reconnect event jika perlu
      },
    );

    on<WebsocketMessageReceived>((event, emit) async {
      log('Received WebSocket message: ${event.message}');

      try {
        final Map<String, dynamic> msg = json.decode(event.message);

        final eventType = msg['event'] ?? '';
        final dataStr = msg['data'];

        if (eventType == 'pusher:connection_established') {
          final Map<String, dynamic> dataJson = json.decode(dataStr);
          final socketId = dataJson['socket_id'] ?? 'unknown';
          await _showNotification(
              'WebSocket connected with socket ID: $socketId');
        } else if (eventType == 'pusher:ping') {
          log('WebSocket Ping received, no action needed.');
        } else if (eventType == 'task.created') {
          // Event task.created diterima, parsing data dan notif khusus
          final Map<String, dynamic> taskData = json.decode(dataStr);
          final taskTitle = taskData['title'] ?? 'Task baru';

          await _showNotification('Task Created: $taskTitle');
        } else {
          // Event lain notif biasa
          await _showNotification(event.message);
        }
      } catch (e) {
        log('Error parsing WebSocket message: $e');
        await _showNotification(event.message);
      }

      emit(WebsocketMessageState(event.message));
    });

    log('WebSocket: Connected and listening...');
  }

  Future<void> _showNotification(String message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'ws_channel',
      'WebSocket Channel',
      channelDescription: 'Channel untuk notifikasi pesan websocket',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await notificationsPlugin.show(
      0,
      'Pesan Baru dari WebSocket',
      message,
      platformChannelSpecifics,
    );
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await channel.sink.close();
    await super.close();
  }
}
