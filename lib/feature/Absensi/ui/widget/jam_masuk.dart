import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:internship_app/feature/Absensi/bloc/absensi_bloc.dart';
import 'package:internship_app/core/utils/toast_utils.dart';

class JamMasukCard extends StatefulWidget {
  const JamMasukCard({super.key});

  @override
  State<JamMasukCard> createState() => _JamMasukCardState();
}

class _JamMasukCardState extends State<JamMasukCard> {
  String? _jamMasuk;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AbsensiBloc, AbsensiState>(
      listener: (context, state) {
        if (state is AbsensiMasukSuccess && state.absen.tipe == 'masuk') {
          showSuccessToast(context, 'Berhasil Absen Masuk');

          context.read<AbsensiBloc>().add(CheckAbsensi('masuk'));
        } else if (state is AbsensiMasukCheckSuccess) {
          final waktu = DateTime.parse(state.absen.waktu);
          final jam = DateFormat.Hm('id_ID').format(waktu);
          setState(() => _jamMasuk = jam);
        } else if (state is AbsensiMasukError) {
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
              const Icon(Icons.login, color: Colors.green),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Jam Masuk',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _jamMasuk ?? '--:--',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
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
