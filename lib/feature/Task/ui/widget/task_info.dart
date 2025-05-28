import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/feature/Logbook/bloc/logbook_bloc.dart';

class TaskInfoCard extends StatelessWidget {
  const TaskInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogbookBloc, LogbookState>(
      listener: (context, state) {},
      builder: (context, state) {
        int total = 0;
        int approved = 0;
        int pending = 0;

        if (state is LogbookLoaded) {
          total = state.logbooks.length;
          approved = state.logbooks.where((e) => e.status == true).length;
          pending = state.logbooks.where((e) => e.status == false).length;
        }

        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.book_outlined, color: Colors.green),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Task ($total)',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _buildBadge(
                          count: approved,
                          label: 'Selesai',
                          color: Colors.green,
                        ),
                        const SizedBox(width: 8),
                        _buildBadge(
                          count: pending,
                          label: 'Proses',
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBadge({
    required int count,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            label == 'Disetujui' ? Icons.check_circle : Icons.pending,
            color: color,
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            '$count $label',
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
