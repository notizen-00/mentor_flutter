import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:internship_app/feature/Task/data/model/task_model.dart';
import 'package:internship_app/feature/Task/data/repository/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;

  TaskBloc({required this.taskRepository}) : super(TaskInitial()) {
    on<CreateTask>(_onCreateTask);
    on<LoadCurrentTask>(_onLoadCurrentTask);
  }

  Future<void> _onCreateTask(
    CreateTask event,
    Emitter<TaskState> emit,
  ) async {
    emit(TaskLoading());
    try {
      final task = await taskRepository.create(
          event.locationId, event.namaTask, event.keterangan);

      if (task != '') {
        final List<TaskModel> tasks = await taskRepository.getCurrentTask();
        emit(TaskLoaded(tasks));
      } else {
        emit(TaskError('Task kosong'));
      }
    } catch (e) {
      emit(TaskError(e.toString()));
    }
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
}
