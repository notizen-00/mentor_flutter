part of 'logbook_bloc.dart';

@immutable
abstract class LogbookEvent {}

class CreateLogbook extends LogbookEvent {
  final LogbookData logbookDatas;

  CreateLogbook(this.logbookDatas);
}

class LoadCurrentLogbook extends LogbookEvent {}
