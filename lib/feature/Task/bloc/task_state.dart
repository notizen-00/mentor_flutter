part of 'task_bloc.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<TaskModel> tasks;

  TaskLoaded(this.tasks);
}

class TaskProgressComplete extends TaskState {
  final String message;

  TaskProgressComplete(this.message);
}

class TaskError extends TaskState {
  final String message;

  TaskError(this.message);
}

class DetailTaskLoaded extends TaskState {
  final TaskModel task;
  final bool alreadyJoined;

  DetailTaskLoaded(this.task, this.alreadyJoined);
}

class JoinTaskSuccess extends TaskState {
  final String message;

  JoinTaskSuccess(this.message);
}

class JoinTaskFailure extends TaskState {
  final String message;

  JoinTaskFailure(this.message);
}

class TaskMessageReceived extends TaskState {
  final String sender;
  final String message;
  final String title;
  TaskMessageReceived(this.sender, this.message, this.title);
}
