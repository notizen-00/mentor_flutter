part of 'informasi_bloc.dart';

@immutable
abstract class InformasiState {}

class InformasiInitial extends InformasiState {}

class InformasiLoading extends InformasiState {}

class InformasiLoaded extends InformasiState {
  final List<InformasiModel> informasis;

  InformasiLoaded(this.informasis);
}

class InformasiError extends InformasiState {
  final String message;

  InformasiError(this.message);
}
