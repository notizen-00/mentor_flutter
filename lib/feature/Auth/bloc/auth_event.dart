part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final String email;
  final String password;

  LoggedIn({required this.email, required this.password});
}

class Register extends AuthEvent {
  final String email;
  final String name;
  final String password;

  Register({required this.email, required this.password, required this.name});
}

class LoggedOut extends AuthEvent {}

final class AuthIsUserLoggedIn extends AuthEvent {}
