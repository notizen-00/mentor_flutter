import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/feature/Siswa/bloc/siswa_bloc.dart';

class ListSiswa extends StatelessWidget {
  const ListSiswa({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SiswaBloc, SiswaState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container();
      },
    );
  }
}
