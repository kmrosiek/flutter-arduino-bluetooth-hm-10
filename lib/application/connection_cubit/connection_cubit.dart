import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ble_sample/domain/ble_characteristic.dart/ble_characteristic.dart';
import 'package:flutter_ble_sample/domain/ble_connection_state.dart';
import 'package:flutter_ble_sample/domain/i_connection_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_state.dart';
part 'connection_cubit.freezed.dart';

class ConnectionCubit extends Cubit<ConnectionState> {
  ConnectionCubit(this._connectionRepository)
      : super(const ConnectionState.disconnected());

  final IConnectionRepository _connectionRepository;

  static const String deviceId = String.fromEnvironment('BLE_DEVICE_ID');
  StreamSubscription<BLEConnectionState>? _connectionStateSubscription;

  void listenToConnectionState() {
    if (_connectionStateSubscription != null) return;
    _connectionStateSubscription = _connectionRepository
        .listenToConnectionState()
        .listen((connectionState) async {
      if (connectionState == BLEConnectionState.connected) {
        await _connectionRepository.discoverServices();
        emit(const ConnectionState.connected());
      } else if (connectionState == BLEConnectionState.disconnected) {
        emit(const ConnectionState.disconnected());
      }
    });
  }

  Either<String, BLECharacteristic> get getCharacteristics =>
      _connectionRepository.getBLECharacteristic;

  Future<void> connect() async {
    emit(const ConnectionState.connecting());
    final errorMessageOrSuccess = await _connectionRepository.connect();
    errorMessageOrSuccess.fold(
        (errorMessage) =>
            emit(ConnectionState.disconnected(message: errorMessage)),
        (_) => null);
  }

  @override
  Future<void> close() {
    _connectionStateSubscription?.cancel();
    _connectionRepository.close();
    return super.close();
  }
}
