import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:internship_app/core/services/websocket_services.dart';
import 'package:internship_app/core/utils/notification_helper.dart';
import 'package:internship_app/feature/Task/data/model/task_model.dart';
import 'package:internship_app/feature/Task/data/repository/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;
  final WebSocketService webSocketService;

  TaskBloc({required this.taskRepository, required this.webSocketService})
      : super(TaskInitial()) {
    on<CreateTask>(_onCreateTask);
    on<LoadCurrentTask>(_onLoadCurrentTask);
    on<ConnectToTaskChannels>(_onConnectToTaskChannels);
    on<LoadDetailTask>(_onLoadDetailTask);
    on<ReceivedTaskMessage>(_onReceivedTaskMessage);
  }

  void _onReceivedTaskMessage(
    ReceivedTaskMessage event,
    Emitter<TaskState> emit,
  ) async {
    log('test nooo');
    await showNotification('Task: ${event.title}', event.message);

    add(LoadCurrentTask());
  }

  Future<void> _onCreateTask(
    CreateTask event,
    Emitter<TaskState> emit,
  ) async {
    emit(TaskLoading());
    try {
      final TaskModel? task = await taskRepository.create(event.task);

      if (task != null) {
        final List<TaskModel> tasks = await taskRepository.getCurrentTask();
        add(ConnectToTaskChannels(task.id));
        emit(TaskLoaded(tasks));
      } else {
        emit(TaskError('Task kosong'));
      }
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<void> _onConnectToTaskChannels(
    ConnectToTaskChannels event,
    Emitter<TaskState> emit,
  ) async {
    emit(TaskLoading());
    await webSocketService.connectPresenceChannel(
      roomId: event.roomId,
      onMessage: (data) async {
        add(ReceivedTaskMessage(
          sender: data['sender'] ?? 'Anonim',
          message: data['message'] ?? '',
          title: data['title'] ?? '',
        ));

        add(LoadCurrentTask());
      },
      onJoin: (name) async {
        add(UserJoinedRoom(name));
        add(LoadCurrentTask());
      },
      onLeave: (name) async {
        add(UserLeftRoom(name));
        add(LoadCurrentTask());
      },
    );
  }

  Future<void> _onLoadCurrentTask(
    LoadCurrentTask event,
    Emitter<TaskState> emit,
  ) async {
    emit(TaskLoading());
    try {
      final List<TaskModel> task = await taskRepository.getCurrentTask();
      emit(TaskLoaded(task));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<void> _onLoadDetailTask(
    LoadDetailTask event,
    Emitter<TaskState> emit,
  ) async {
    emit(TaskLoading());
    try {
      final TaskModel task = event.task;
      emit(DetailTaskLoaded(task));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }
}
