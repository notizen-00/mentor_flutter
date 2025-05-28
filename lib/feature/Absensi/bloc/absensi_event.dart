part of 'absensi_bloc.dart';

abstract class AbsensiEvent {}

class AppStarted extends AbsensiEvent {}

class CheckAbsensi extends AbsensiEvent {
  final String tipe;

  CheckAbsensi(this.tipe);
}

class DoAbsen extends AbsensiEvent {
  final String tipe;

  DoAbsen(this.tipe);
}

class Register extends AbsensiEvent {
  final String email;
  final String name;
  final String password;

  Register({required this.email, required this.password, required this.name});
}

final class AbsensiIsUserLoggedIn extends AbsensiEvent {}
