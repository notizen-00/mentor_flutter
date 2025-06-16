part of 'logbook_bloc.dart';

@immutable
abstract class LogbookEvent {}

class CreateLogbook extends LogbookEvent {
  final int locationId;
  final String namaTask;
  final String keterangan;

  CreateLogbook(
      {required this.locationId,
      required this.namaTask,
      required this.keterangan});
}

class VerifikasiLogbook extends LogbookEvent {
  final double rating;
  final int logbookId;
  final String keterangan;

  VerifikasiLogbook(
      {required this.logbookId,
      required this.rating,
      required this.keterangan});
}

class LoadCurrentLogbook extends LogbookEvent {}
