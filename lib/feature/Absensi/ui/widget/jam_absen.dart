import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:internship_app/feature/Absensi/bloc/absensi_bloc.dart';
import 'package:internship_app/core/utils/toast_utils.dart';

class JamAbsenCard extends StatefulWidget {
  const JamAbsenCard({super.key});

  @override
  State<JamAbsenCard> createState() => _JamAbsenCardState();
}

class _JamAbsenCardState extends State<JamAbsenCard> {
  String? _jamMasuk;
  String? _jamKeluar;

  String formatJam(String waktu) {
    final parsed = DateTime.parse(waktu);
    return DateFormat.Hm('id_ID').format(parsed);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AbsensiBloc, AbsensiState>(
      listener: (context, state) {
        if (state is AbsensiMasukSuccess && state.absen.tipe == 'masuk') {
          setState(() => _jamMasuk = formatJam(state.absen.waktu));
        } else if (state is AbsensiKeluarSuccess &&
            state.absen.tipe == 'keluar') {
          setState(() => _jamKeluar = formatJam(state.absen.waktu));
        } else if (state is AbsensiCheckSuccess) {
          final tipe = state.absen.tipe;
          final jam = formatJam(state.absen.waktu);
          if (tipe == 'masuk') {
            setState(() => _jamMasuk = jam);
          } else if (tipe == 'keluar') {
            setState(() => _jamKeluar = jam);
          }
        } else if (state is AbsensiCheckError) {
          showErrorToast(context, state.message);
        }
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildAbsenColumn(Icons.login, 'Masuk', _jamMasuk, Colors.green),
              const VerticalDivider(thickness: 1),
              _buildAbsenColumn(Icons.logout, 'Keluar', _jamKeluar, Colors.red),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAbsenColumn(
      IconData icon, String label, String? jam, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 2),
        Text(jam ?? '--:--',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
            )),
      ],
    );
  }
}
