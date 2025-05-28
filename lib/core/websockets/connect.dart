import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:internship_app/core/utils/notification_helper.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void connectToPusher() async {
  const reverbHost = '10.10.10.144';
  const reverbAppKey = 'wxchwyrzgjxjax9qvx5a';

  const wsUrl = 'ws://$reverbHost:8081/app/$reverbAppKey';
  final channel = WebSocketChannel.connect(Uri.parse(wsUrl));

  final subscription = {
    "event": "pusher:subscribe",
    "data": {"channel": "delivery"}
  };

  channel.sink.add(jsonEncode(subscription));

  channel.stream.listen(
    (message) async {
      log('Received Ws: $message');

      try {
        final parsed = jsonDecode(message);

        if (message.toString().contains('ping')) {
          // If it does, send a response with the string 'pong'
          channel.sink.add(json.encode(
            {"event": "pusher:pong"},
          ));
          log('pong');
        }

        final channelName = parsed['channel'];
        log(channelName);

        final rawData = parsed['data'];

        if (channelName == 'delivery' && parsed['eventName'] == 'event.task') {
          final data = jsonDecode(rawData);

          final status = data['status'] ?? 'Status tidak diketahui';
          final handler = data['deliveryHandler'] ?? 'Pengirim tidak diketahui';

          final notifMessage = 'Judul: $status\nDeskripsi: $handler';
          log(notifMessage);
          await showNotification('Pengumuman', notifMessage);
        }
      } catch (e) {
        log('Error parsing WebSocket message: $e');
      }
    },
    onDone: () {
      log('Connection closed.');
    },
    onError: (error) {
      log('Error Ws: $error');
    },
  );
}
