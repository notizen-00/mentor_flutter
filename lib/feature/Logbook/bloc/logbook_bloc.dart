import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:internship_app/feature/Logbook/data/model/logbook_model.dart';
import 'package:internship_app/feature/Logbook/data/repository/logbook_repository.dart';

part 'logbook_event.dart';
part 'logbook_state.dart';

class LogbookBloc extends Bloc<LogbookEvent, LogbookState> {
  final LogbookRepository logbookRepository;

  LogbookBloc({required this.logbookRepository}) : super(LogbookInitial()) {
    on<CreateLogbook>(_onCreateLogbook);
    on<LoadCurrentLogbook>(_onLoadCurrentLogbook);
    on<VerifikasiLogbook>(_onVerifikasiLogbook);
  }

  Future<void> _onCreateLogbook(
    CreateLogbook event,
    Emitter<LogbookState> emit,
  ) async {
    emit(LogbookLoading());
    try {
      final logbook = await logbookRepository.create(
          event.locationId, event.namaTask, event.keterangan);

      if (logbook != '') {
        final List<Logbook> logbooks =
            await logbookRepository.getCurrentLogbook();
        emit(LogbookLoaded(logbooks));
      } else {
        emit(LogbookError('Logbook kosong'));
      }
    } catch (e) {
      emit(LogbookError(e.toString()));
    }
  }

  Future<void> _onVerifikasiLogbook(
    VerifikasiLogbook event,
    Emitter<LogbookState> emit,
  ) async {
    emit(LogbookLoading());
    try {
      final logbook = await logbookRepository.verifikasi(
          event.logbookId, event.rating, event.keterangan);

      if (logbook != '') {
        final List<Logbook> logbooks =
            await logbookRepository.getCurrentLogbook();
        emit(LogbookLoaded(logbooks));
      } else {
        emit(LogbookError('Logbook kosong'));
      }
    } catch (e) {
      emit(LogbookError(e.toString()));
    }
  }

  Future<void> _onLoadCurrentLogbook(
    LoadCurrentLogbook event,
    Emitter<LogbookState> emit,
  ) async {
    emit(LogbookLoading());
    try {
      final List<Logbook> logbook = await logbookRepository.getCurrentLogbook();
      emit(LogbookLoaded(logbook));
    } catch (e) {
      emit(LogbookError(e.toString()));
    }
  }
}
