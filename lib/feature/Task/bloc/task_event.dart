part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class CreateTask extends TaskEvent {
  final int locationId;
  final String namaTask;
  final String keterangan;

  CreateTask(
      {required this.locationId,
      required this.namaTask,
      required this.keterangan});
}

class LoadCurrentTask extends TaskEvent {}
