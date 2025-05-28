part of 'websocket_bloc.dart';

abstract class WebsocketState {}

class WebsocketInitial extends WebsocketState {}

class WebsocketMessageState extends WebsocketState {
  final String message;
  WebsocketMessageState(this.message);
}
