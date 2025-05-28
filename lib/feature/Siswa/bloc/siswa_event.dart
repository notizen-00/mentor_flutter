part of 'siswa_bloc.dart';

abstract class SiswaEvent {}

class AppStarted extends SiswaEvent {}

class SiswaCheck extends SiswaEvent {}

class SiswaListCheck extends SiswaEvent {}

class CreateSiswa extends SiswaEvent {
  final SiswaDataModel siswa;

  CreateSiswa(this.siswa);
}

class Register extends SiswaEvent {
  final String email;
  final String name;
  final String password;

  Register({required this.email, required this.password, required this.name});
}

final class SiswaIsUserLoggedIn extends SiswaEvent {}
