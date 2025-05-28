part of 'logbook_bloc.dart';

@immutable
abstract class LogbookState {}

class LogbookInitial extends LogbookState {}

class LogbookLoading extends LogbookState {}

class LogbookLoaded extends LogbookState {
  final List<Logbook> logbooks;

  LogbookLoaded(this.logbooks);
}

class LogbookError extends LogbookState {
  final String message;

  LogbookError(this.message);
}
