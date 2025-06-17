part of 'siswa_bloc.dart';

abstract class SiswaState {}

class SiswaInitial extends SiswaState {}

class SiswaLoading extends SiswaState {}

class SiswaSuccess extends SiswaState {
  final UserModel user;
  SiswaSuccess(this.user);
}

class SiswaListSuccess extends SiswaState {
  final List<SiswaModel> siswa;
  SiswaListSuccess(this.siswa);
}

class SiswaUnSiswaenticated extends SiswaState {}

class SiswaError extends SiswaState {
  final String message;
  SiswaError(this.message);
}
