import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:internship_app/feature/Absensi/bloc/absensi_bloc.dart';
import 'package:internship_app/core/utils/toast_utils.dart';

class JamKeluarCard extends StatefulWidget {
  const JamKeluarCard({super.key});

  @override
  State<JamKeluarCard> createState() => _JamKeluarCardState();
}

class _JamKeluarCardState extends State<JamKeluarCard> {
  String? _jamKeluar;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AbsensiBloc, AbsensiState>(
      listener: (context, state) {
        if (state is AbsensiKeluarSuccess && state.absen.tipe == 'keluar') {
          showSuccessToast(context, 'Berhasil Absen Keluar');
          context.read<AbsensiBloc>().add(CheckAbsensi('keluar'));
        } else if (state is AbsensiKeluarCheckSuccess) {
          final waktu = DateTime.parse(state.absen.waktu);
          final jam = DateFormat.Hm('id_ID').format(waktu);
          setState(() => _jamKeluar = jam);
        } else if (state is AbsensiKeluarError) {
          showErrorToast(context, state.message);
        }
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.logout, color: Colors.orange),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Jam Pulang',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _jamKeluar ?? '--:--',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
