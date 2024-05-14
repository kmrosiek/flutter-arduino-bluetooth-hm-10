part of 'connection_cubit.dart';

@freezed
sealed class ConnectionState with _$ConnectionState {
  const ConnectionState._();
  const factory ConnectionState.disconnected({String? message}) = _Disconnected;
  const factory ConnectionState.connecting() = _Connecting;
  const factory ConnectionState.connected() = _Connected;

  bool get isDisconnected => this is _Disconnected;

  String? get messageIfAny => when(
      disconnected: (maybeMessage) => maybeMessage,
      connecting: () => 'Connecting',
      connected: () => null);
}
