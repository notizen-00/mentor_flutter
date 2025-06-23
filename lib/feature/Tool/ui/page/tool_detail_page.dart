import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/theme/app_colors.dart';
import 'package:internship_app/feature/Tool/bloc/tool_bloc.dart';
import 'package:intl/intl.dart';

class ToolDetailPage extends StatelessWidget {
  const ToolDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ToolBloc, ToolState>(
      listener: (context, state) {
        if (state is ToolDetailLoaded) {
          // Aksi tambahan kalau perlu
        }
      },
      child: BlocBuilder<ToolBloc, ToolState>(
        builder: (context, state) {
          if (state is ToolDetailLoaded) {
            final tool = state.tool;
            final stockLogs = tool.stockOpname;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.primary,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    context.read<ToolBloc>().add(LoadCurrentTool());
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  'Detail Alat: ${tool.namaAlat}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tool.namaAlat,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Stok Saat Ini: ${tool.qty}',
                      style: TextStyle(
                        fontSize: 13,
                        color: tool.qty > 0 ? Colors.green : Colors.red,
                      ),
                    ),
                    const Divider(height: 24),
                    const Text(
                      'Riwayat Stok:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: stockLogs.isEmpty
                          ? const Center(
                              child: Text(
                                'Belum ada riwayat stok.',
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          : ListView.separated(
                              itemCount: stockLogs.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 8),
                              itemBuilder: (context, index) {
                                final log = stockLogs[index];
                                final isAddition =
                                    log.typeOpname == 'penambahan';
                                final icon = isAddition
                                    ? Icons.add_circle
                                    : Icons.remove_circle;
                                final color =
                                    isAddition ? Colors.green : Colors.red;

                                return Card(
                                  child: ListTile(
                                    isThreeLine: true,
                                    leading: Icon(icon, color: color),
                                    title: Text(
                                      '${log.typeName} / ${log.qty} item',
                                      style: const TextStyle(fontSize: 13),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Chip(
                                          label: Text(
                                            log.lokasi,
                                            style: const TextStyle(
                                                fontSize: 11,
                                                color: Colors.white),
                                          ),
                                          visualDensity: VisualDensity.compact,
                                          backgroundColor: Colors.green,
                                        ),
                                        Text(
                                          log.keterangan,
                                          style: const TextStyle(fontSize: 12),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            const Icon(Icons.person,
                                                size: 14, color: Colors.grey),
                                            const SizedBox(width: 4),
                                            Flexible(
                                              child: Text(
                                                log.user.name,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black87),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          _formatDate(log.createdAt),
                                          style: const TextStyle(
                                              fontSize: 11, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ToolLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Text(
                  'Server Error!',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  String _formatDate(dynamic raw) {
    DateTime? dateTime;

    if (raw is String) {
      dateTime = DateTime.tryParse(raw);
    } else if (raw is DateTime) {
      dateTime = raw;
    }

    if (dateTime != null) {
      return DateFormat('d MMM yyyy • HH:mm', 'id_ID').format(dateTime);
    }

    return '';
  }
}
