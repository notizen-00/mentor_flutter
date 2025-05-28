// feature/Siswa/ui/siswa_page.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/theme/app_colors.dart';
import 'package:internship_app/feature/Root/ui/root_page.dart';
import 'package:internship_app/feature/Siswa/ui/widget/siswa_form.dart';
import 'package:internship_app/feature/Siswa/bloc/siswa_bloc.dart'; // Ganti sesuai path bloc kamu

class SiswaPage extends StatelessWidget {
  const SiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lengkapi Data Siswa',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: BlocListener<SiswaBloc, SiswaState>(
        listener: (context, state) {
          if (state is SiswaSuccess) {
            log('$state');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Data siswa berhasil disimpan')),
            );
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const RootPage()),
              (route) => false,
            );
          } else if (state is SiswaError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Gagal menyimpan data: ${state.message}')),
            );
          }
        },
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: SiswaForm(),
          ),
        ),
      ),
    );
  }
}
