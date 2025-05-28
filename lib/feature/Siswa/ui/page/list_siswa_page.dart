import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/theme/app_colors.dart';
import 'package:internship_app/feature/Siswa/bloc/siswa_bloc.dart';
import 'package:internship_app/feature/Siswa/data/model/siswa_model.dart';

class ListSiswaPage extends StatelessWidget {
  const ListSiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Daftar Siswa Magang'),
          backgroundColor: AppColors.white,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: AppColors.primary,
              ),
              onPressed: () {},
            ),
          ]),
      body: BlocBuilder<SiswaBloc, SiswaState>(
        builder: (context, state) {
          if (state is SiswaLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SiswaListSuccess) {
            final List<SiswaModel> siswaList = state.siswa;
            final scrollController = FixedExtentScrollController(
              initialItem: siswaList.length ~/ 2,
            );
            return Card(
              color: AppColors.primary,
              child: ListWheelScrollView.useDelegate(
                itemExtent: 200,
                controller: scrollController,
                physics: const FixedExtentScrollPhysics(),
                perspective: 0.003,
                diameterRatio: 1.5,
                useMagnifier: true,
                magnification: 1,
                offAxisFraction: -0.3,
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    if (index < 0 || index >= siswaList.length) return null;
                    final siswa = siswaList[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 500,
                        child: ListTile(
                          minTileHeight: 600,
                          title: Text(siswa.user.name),
                          subtitle: Text('ID: ${siswa.id}'),
                        ),
                      ),
                    );
                  },
                  childCount: siswaList.length,
                ),
              ),
            );
          } else if (state is SiswaError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('Tidak ada data'));
        },
      ),
    );
  }
}
