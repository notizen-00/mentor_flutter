part of 'tool_bloc.dart';

@immutable
abstract class ToolState {}

class ToolInitial extends ToolState {}

class ToolLoading extends ToolState {}

class ToolLoaded extends ToolState {
  final List<ToolModel> tools;

  ToolLoaded(this.tools);
}

class ToolError extends ToolState {
  final String message;

  ToolError(this.message);
}
