part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class CreateTask extends TaskEvent {
  final TaskCreateData task;
  CreateTask({required this.task});
}

class LoadCurrentTask extends TaskEvent {}

class LoadDetailTask extends TaskEvent {
  final TaskModel task;

  LoadDetailTask(this.task);
}

class JoinTask extends TaskEvent {
  final int taskId;

  JoinTask({required this.taskId});
}

class ConnectToTaskChannels extends TaskEvent {
  final int roomId;
  ConnectToTaskChannels(this.roomId);
}

class ReceivedTaskMessage extends TaskEvent {
  final String sender;
  final String message;
  final String title;
  ReceivedTaskMessage(
      {required this.sender, required this.message, required this.title});
}

class UserJoinedRoom extends TaskEvent {
  final String name;
  UserJoinedRoom(this.name);
}

class UserLeftRoom extends TaskEvent {
  final String name;
  UserLeftRoom(this.name);
}
