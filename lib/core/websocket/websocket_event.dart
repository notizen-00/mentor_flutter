part of 'websocket_bloc.dart';

abstract class WebsocketEvent {}

class WebsocketMessageReceived extends WebsocketEvent {
  final String message;
  WebsocketMessageReceived(this.message);
}
