part of 'absensi_bloc.dart';

abstract class AbsensiState {}

class AbsensiInitial extends AbsensiState {}

class AbsensiLoading extends AbsensiState {}

class AbsensiSuccess extends AbsensiState {
  final HistoryAbsensiModel absen;
  AbsensiSuccess(this.absen);
}

class AbsensiCheckSuccess extends AbsensiState {
  final HistoryAbsensiModel absen;
  AbsensiCheckSuccess(this.absen);
}

class AbsensiMasukCheckSuccess extends AbsensiState {
  final HistoryAbsensiModel absen;
  AbsensiMasukCheckSuccess(this.absen);
}

class AbsensiKeluarCheckSuccess extends AbsensiState {
  final HistoryAbsensiModel absen;
  AbsensiKeluarCheckSuccess(this.absen);
}

class AbsensiMasukSuccess extends AbsensiState {
  final HistoryAbsensiModel absen;
  AbsensiMasukSuccess(this.absen);
}

class AbsensiKeluarSuccess extends AbsensiState {
  final HistoryAbsensiModel absen;
  AbsensiKeluarSuccess(this.absen);
}

class AbsensiUnAbsensienticated extends AbsensiState {}

class AbsensiCheckError extends AbsensiState {
  final String message;
  AbsensiCheckError(this.message);
}

class AbsensiMasukError extends AbsensiState {
  final String message;
  AbsensiMasukError(this.message);
}

class AbsensiKeluarError extends AbsensiState {
  final String message;
  AbsensiKeluarError(this.message);
}
