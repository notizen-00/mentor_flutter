import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:internship_app/feature/Informasi/data/model/informasi_model.dart';
import 'package:internship_app/feature/Informasi/data/repository/informasi_repository.dart';

part 'informasi_event.dart';
part 'informasi_state.dart';

class InformasiBloc extends Bloc<InformasiEvent, InformasiState> {
  final InformasiRepository informasiRepository;

  InformasiBloc({required this.informasiRepository})
      : super(InformasiInitial()) {
    on<LoadCurrentInformasi>(_onLoadCurrentInformasi);
  }

  Future<void> _onLoadCurrentInformasi(
    LoadCurrentInformasi event,
    Emitter<InformasiState> emit,
  ) async {
    emit(InformasiLoading());
    try {
      final List<InformasiModel> informasi =
          await informasiRepository.getCurrentInformasi();
      emit(InformasiLoaded(informasi));
    } catch (e) {
      emit(InformasiError(e.toString()));
    }
  }
}
