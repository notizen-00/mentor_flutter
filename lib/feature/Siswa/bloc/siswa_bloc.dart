import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/feature/Siswa/data/model/siswa_model.dart';
import 'package:internship_app/feature/Siswa/data/repository/siswa_repository.dart';
import 'package:internship_app/core/utils/siswa_manager.dart'; // import token manager

part 'siswa_event.dart';
part 'siswa_state.dart';

class SiswaBloc extends Bloc<SiswaEvent, SiswaState> {
  final SiswaRepository siswaRepository;
  final SiswaManager siswaManager;

  SiswaBloc({
    required this.siswaRepository,
    required this.siswaManager,
  }) : super(SiswaInitial()) {
    /// App startup - check token & user
    on<AppStarted>((event, emit) async {
      emit(SiswaLoading());
      final siswa = await siswaManager.getSiswa();
      if (siswa != null) {
        final siswaDto = SiswaModel.fromJson(siswa as Map<String, dynamic>);

        emit(SiswaSuccess(siswaDto));
      } else {
        emit(SiswaError('gak ada data siswa'));
      }
    });

    on<SiswaListCheck>((event, emit) async {
      emit(SiswaLoading());
      final siswa = await siswaRepository.getListSiswa();
      if (siswa != null) {
        emit(SiswaListSuccess(siswa));
        log('kamu di success ');
      } else {
        log('kamu di error ');
        emit(SiswaError('gak ada data siswa'));
      }
    });

    on<SiswaCheck>((event, emit) async {
      emit(SiswaLoading());
      final siswa = await siswaRepository.getCurrentUser();
      if (siswa != null) {
        emit(SiswaSuccess(siswa));
        log('kamu di success ');
      } else {
        log('kamu di error ');
        emit(SiswaError('gak ada data siswa'));
      }
    });

    on<CreateSiswa>((event, emit) async {
      try {
        emit(SiswaLoading());
        final response = await siswaRepository.create(event.siswa);

        if (response != null) {
          emit(SiswaSuccess(response));
        } else {
          emit(SiswaError('Login failed. Please check your credentials.'));
        }
      } catch (e) {
        emit(SiswaError('An error occurred during login.'));
      }
    });
  }
}
