import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:internship_app/feature/Task/data/model/task_model.dart';
import 'package:internship_app/feature/Tool/data/model/tool_model.dart';
import 'package:internship_app/feature/Tool/data/repository/tool_repository.dart';

part 'tool_event.dart';
part 'tool_state.dart';

class ToolBloc extends Bloc<ToolEvent, ToolState> {
  final ToolRepository toolRepository;

  ToolBloc({required this.toolRepository}) : super(ToolInitial()) {
    on<CreateTool>(_onCreateTool);
    on<LoadCurrentTool>(_onLoadCurrentTool);
    on<LoadDetailTool>(_onLoadDetailTool);
    on<BringBackTool>(_onBringBackTool);
  }

  Future<void> _onCreateTool(
    CreateTool event,
    Emitter<ToolState> emit,
  ) async {
    emit(ToolLoading());
    try {
      final tool = await toolRepository.create(
          event.locationId, event.namaTask, event.keterangan);

      if (tool != '') {
        final List<ToolModel> tools = await toolRepository.getCurrentTool();
        emit(ToolLoaded(tools));
      } else {
        emit(ToolError('Tool kosong'));
      }
    } catch (e) {
      emit(ToolError(e.toString()));
    }
  }

  Future<void> _onLoadCurrentTool(
    LoadCurrentTool event,
    Emitter<ToolState> emit,
  ) async {
    emit(ToolLoading());
    try {
      final List<ToolModel> tool = await toolRepository.getCurrentTool();
      emit(ToolLoaded(tool));
    } catch (e) {
      emit(ToolError(e.toString()));
    }
  }

  Future<void> _onLoadDetailTool(
    LoadDetailTool event,
    Emitter<ToolState> emit,
  ) async {
    emit(ToolLoading());
    try {
      final Tool tool = await toolRepository.getDetailTool(event.toolId);
      emit(ToolDetailLoaded(tool));
    } catch (e) {
      emit(ToolError(e.toString()));
    }
  }

  Future<void> _onBringBackTool(
    BringBackTool event,
    Emitter<ToolState> emit,
  ) async {
    emit(ToolLoading());
    try {
      final TaskModel task = await toolRepository.bringBackTool(event.toolId);

      emit(ToolBackSuccess(task));
    } catch (e) {
      emit(ToolError(e.toString()));
    }
  }
}
