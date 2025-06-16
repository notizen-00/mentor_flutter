import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/const/constanst.dart';
import 'package:internship_app/core/theme/app_colors.dart';
import 'package:internship_app/core/utils/image_helper.dart';
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
            icon: const Icon(Icons.notifications, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<SiswaBloc, SiswaState>(
        builder: (context, state) {
          if (state is SiswaLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SiswaListSuccess) {
            final List<SiswaModel> siswaList = state.siswa;
            final scrollController = FixedExtentScrollController(
              initialItem: siswaList.length ~/ 2,
            );

            return Container(
              color: AppColors.primary.withOpacity(0.1),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ListWheelScrollView.useDelegate(
                itemExtent: 220,
                controller: scrollController,
                physics: const FixedExtentScrollPhysics(),
                perspective: 0.003,
                diameterRatio: 1.5,
                useMagnifier: false,
                magnification: 1.1,
                offAxisFraction: -0.2,
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    if (index < 0 || index >= siswaList.length) return null;
                    final siswa = siswaList[index];

                    return SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.9, // Hampir penuh (90%)
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.primary.withOpacity(0.9),
                                AppColors.primary.withOpacity(0.7),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                child: ClipOval(
                                  child: siswa.user.picture != null
                                      ? UniversalNetworkImage(
                                          url:
                                              '${AppConstants.baseStorage}/${siswa.user.picture!}',
                                          width: 80,
                                          height: 80,
                                        )
                                      : const Icon(
                                          Icons.person,
                                          size: 40,
                                          color: Colors.grey,
                                        ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                siswa.user.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                siswa.asalSekolah,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                siswa.jurusan,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
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
