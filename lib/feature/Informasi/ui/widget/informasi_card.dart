import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/feature/Informasi/bloc/informasi_bloc.dart';
import 'package:intl/intl.dart';

class InformasiInfoCard extends StatelessWidget {
  const InformasiInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InformasiBloc, InformasiState>(
      listener: (context, state) {},
      builder: (context, state) {
        int saatIni = 0;
        // ignore: unused_local_variable
        int kedepan = 0;

        if (state is InformasiLoaded) {
          final today = DateTime.now();
          final todayStr = DateFormat('yyyy-MM-dd').format(today);

          for (var info in state.informasis) {
            final jadwalDate = DateTime.tryParse(info.jadwalInformasi);
            if (jadwalDate != null) {
              final jadwalStr = DateFormat('yyyy-MM-dd').format(jadwalDate);

              if (jadwalStr == todayStr) {
                saatIni++;
              } else if (jadwalDate.isAfter(today)) {
                kedepan++;
              }
            }
          }
        }

        return SizedBox(
          width:
              MediaQuery.of(context).size.width * 0.9, // Tetapkan lebar tetap
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Staff',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          _buildBadge(
                            count: saatIni,
                            label: 'Bismillāhir-raḥmānir-raḥīm',
                            color: Colors.green,
                            icon: Icons.check_circle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
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
    required IconData icon,
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
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 4),
          Text(
            label,
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
