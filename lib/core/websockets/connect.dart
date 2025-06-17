import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/utils/notification_helper.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void connectToPusher() async {
  const reverbHost = '10.6.93.174';
  const reverbAppKey = 'wxchwyrzgjxjax9qvx5a';

  const wsUrl = 'ws://$reverbHost:8080/app/$reverbAppKey';
  final channel = WebSocketChannel.connect(Uri.parse(wsUrl));

  // Kirim subscribe untuk dua channel
  final subscriptions = [
    {
      "event": "pusher:subscribe",
      "data": {"channel": "delivery"}
    },
    {
      "event": "pusher:subscribe",
      "data": {"channel": "public.task"}
    },
  ];

  for (var sub in subscriptions) {
    channel.sink.add(jsonEncode(sub));
  }

  channel.stream.listen(
    (message) async {
      log('Received Ws: $message');

      try {
        final parsed = jsonDecode(message);

        // Ping/pong handling
        if (message.toString().contains('ping')) {
          channel.sink.add(json.encode({"event": "pusher:pong"}));
          log('pong sent');
          return;
        }

        final channelName = parsed['channel'];
        final eventName = parsed['event'];
        final rawData = parsed['data'];

        if (channelName == 'delivery') {
          final data = jsonDecode(rawData);
          final status = data['status'] ?? 'Status tidak diketahui';
          final handler = data['deliveryHandler'] ?? 'Pengirim tidak diketahui';
          final notifMessage = 'Judul: $status\nDeskripsi: $handler';
          log('Notifikasi Delivery: $notifMessage');
          // await showNotification('Pengumuman', notifMessage);
        }

        if (channelName == 'public.task' && eventName == 'event.task') {
          final rawData = parsed['data'];

          // Decode pertama karena 'data' masih berupa string JSON
          final decodedData = jsonDecode(rawData);

          // Ambil task-nya
          final task = decodedData['task'];

          final kegiatan = task['nama_kegiatan'] ?? 'Kegiatan Baru';
          final waktu = task['created_at'] ?? 'Waktu tidak diketahui';

          final notifMessage = 'Logbook Baru: $kegiatan\nWaktu: $waktu';
          log('Notifikasi Task: $notifMessage');
          await showNotification('Logbook Masuk', notifMessage);

          // Kalau pakai BLoC, bisa kirim event ke BLoC juga
          // context.read<LogbookBloc>().add(LogbookReceived(task));
        }
      } catch (e) {
        log('Error parsing WebSocket message: $e');
      }
    },
    onDone: () => log('WebSocket connection closed.'),
    onError: (error) => log('WebSocket error: $error'),
  );
}
