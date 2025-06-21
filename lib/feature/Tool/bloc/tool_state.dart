part of 'tool_bloc.dart';

@immutable
abstract class ToolState {}

class ToolInitial extends ToolState {}

class ToolLoading extends ToolState {}

class ToolLoaded extends ToolState {
  final List<ToolModel> tools;

  ToolLoaded(this.tools);
}

class ToolDetailLoaded extends ToolState {
  final Tool tool;
  ToolDetailLoaded(this.tool);
}

class ToolSuccess extends ToolState {
  final String message;
  ToolSuccess(this.message);
}

class ToolBackSuccess extends ToolState {
  final TaskModel task;
  ToolBackSuccess(this.task);
}

class ToolError extends ToolState {
  final String message;

  ToolError(this.message);
}
