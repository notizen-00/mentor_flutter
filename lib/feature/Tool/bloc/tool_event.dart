part of 'tool_bloc.dart';

@immutable
abstract class ToolEvent {}

class CreateTool extends ToolEvent {
  final int locationId;
  final String namaTask;
  final String keterangan;

  CreateTool(
      {required this.locationId,
      required this.namaTask,
      required this.keterangan});
}

class VerifikasiTool extends ToolEvent {
  final double rating;
  final int toolId;
  final String keterangan;

  VerifikasiTool(
      {required this.toolId, required this.rating, required this.keterangan});
}

class LoadCurrentTool extends ToolEvent {}

class LoadDetailTool extends ToolEvent {
  final int toolId;

  LoadDetailTool({required this.toolId});
}

class BringBackTool extends ToolEvent {
  final int toolId;

  BringBackTool({required this.toolId});
}
