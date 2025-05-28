import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/feature/Absensi/data/model/absensi_model.dart';
import 'package:internship_app/feature/Absensi/data/repository/absensi_repository.dart';
import 'package:internship_app/core/utils/absensi_manager.dart'; // import token manager

part 'absensi_event.dart';
part 'absensi_state.dart';

class AbsensiBloc extends Bloc<AbsensiEvent, AbsensiState> {
  final AbsensiRepository absensiRepository;
  final AbsensiManager absensiManager;

  AbsensiBloc({
    required this.absensiRepository,
    required this.absensiManager,
  }) : super(AbsensiInitial()) {
    /// App startup - check token & user
    on<AppStarted>((event, emit) async {
      emit(AbsensiLoading());
      final absensi = await absensiManager.getAbsensi();

      if (absensi != null) {
        final absensiDto =
            HistoryAbsensiModel.fromJson(absensi as Map<String, dynamic>);

        emit(AbsensiCheckSuccess(absensiDto));
      } else {
        emit(AbsensiCheckError('gak ada data Absensi'));
      }
    });

    on<CheckAbsensi>((event, emit) async {
      try {
        emit(AbsensiLoading());
        final response = await absensiRepository.checkAbsen(event.tipe);

        if (response != null) {
          if (event.tipe == 'masuk') {
            emit(AbsensiMasukCheckSuccess(response));
          } else {
            emit(AbsensiKeluarCheckSuccess(response));
          }
        } else {
          // emit(AbsensiCheckError('Anda belum absen hari ini !'));
        }
      } catch (e) {
        // emit(AbsensiCheckError('An error occurred during login.'));
      }
    });

    on<DoAbsen>((event, emit) async {
      try {
        emit(AbsensiLoading());
        final response = await absensiRepository.absen(event.tipe);

        if (response != null) {
          if (event.tipe == 'masuk') {
            emit(AbsensiMasukSuccess(response));
          } else {
            emit(AbsensiKeluarSuccess(response));
          }
        } else {
          if (event.tipe == 'masuk') {
            emit(AbsensiMasukError('Anda sudah absen ${event.tipe}'));
          } else {
            emit(AbsensiKeluarError('Anda sudah absen ${event.tipe}'));
          }
        }
      } catch (e) {
        emit(AbsensiCheckError('An error occurred during login.'));
      }
    });
  }
}
