part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class CreateTask extends TaskEvent {
  final TaskModel taskDatas;

  CreateTask(this.taskDatas);
}

class LoadCurrentTask extends TaskEvent {}
