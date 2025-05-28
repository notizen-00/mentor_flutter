import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:internship_app/feature/Logbook/data/model/logbook_model.dart';

class LogbookTimeline extends StatelessWidget {
  final List<Logbook> logbooks;

  const LogbookTimeline({super.key, required this.logbooks});

  @override
  Widget build(BuildContext context) {
    final items = logbooks.where((e) => e.logbookVerifikasi != null).toList()
      ..sort(
          (a, b) => b.createdAt.compareTo(a.createdAt)); // paling baru di atas

    if (items.isEmpty) {
      return const Center(
        child: Text('Belum ada verifikasi logbook.'),
      );
    }

    return Timeline.tileBuilder(
      theme: TimelineThemeData(
        nodePosition: 0,
        indicatorTheme: const IndicatorThemeData(position: 0, size: 20.0),
        connectorTheme: const ConnectorThemeData(thickness: 2.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      builder: TimelineTileBuilder.connected(
        itemCount: items.length,
        connectorBuilder: (_, index, __) => const SolidLineConnector(),
        indicatorBuilder: (_, index) => const DotIndicator(color: Colors.green),
        contentsBuilder: (_, index) {
          final verif = items[index].logbookVerifikasi!;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items[index].namaKegiatan,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text('Rating: ${verif.rating}/5'),
                Text('Keterangan: ${verif.keterangan}'),
                Text('Oleh: ${verif.mentor.name}'),
                Text('Tanggal: ${verif.createdAt.toLocal()}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
