import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ble_sample/presentation/common/exceptions/pretty_exception.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_state.dart';
part 'connection_cubit.freezed.dart';

class ConnectionCubit extends Cubit<ConnectionState> {
  ConnectionCubit() : super(const ConnectionState.disconnected());

  static const String deviceId = String.fromEnvironment('BLE_DEVICE_ID');
  static const String serviceIdStr128 = '0000ffe0-0000-1000-8000-00805f9b34fb';
  static const String characteristicIdStr128 =
      '0000ffe1-0000-1000-8000-00805f9b34fb';
  final BluetoothDevice device =
      BluetoothDevice(remoteId: const DeviceIdentifier(deviceId));
  StreamSubscription<BluetoothConnectionState>? _connectionStateSubscription;

  void listenToConnectionState() {
    if (_connectionStateSubscription != null) return;
    _connectionStateSubscription =
        device.connectionState.listen((connectionState) async {
      log('ConnectionState: $connectionState');
      if (connectionState == BluetoothConnectionState.connected) {
        await device.discoverServices();
        emit(const ConnectionState.connected());
      } else if (connectionState == BluetoothConnectionState.disconnected) {
        emit(const ConnectionState.disconnected());
      }
    });
  }

  Either<String, BluetoothCharacteristic> get getCharacteristics {
    try {
      final service = device.servicesList.firstWhere(
          (service) => service.serviceUuid.str128 == serviceIdStr128);
      final characteristic = service.characteristics.firstWhere(
          (characteristic) =>
              characteristic.characteristicUuid.str128 ==
              characteristicIdStr128);
      return Right(characteristic);
    } catch (e) {
      final errorMessage =
          Pretty.exception('Could not get characteristics ', e);
      log(errorMessage);
      return Left(errorMessage);
    }
  }

  void connect() async {
    emit(const ConnectionState.connecting());
    try {
      await device.connect(timeout: const Duration(seconds: 2));
    } catch (e) {
      log(Pretty.exception('Exception when connecting:', e));
      emit(ConnectionState.disconnected(message: Pretty.exception('', e)));
    }
  }

  @override
  Future<void> close() {
    _connectionStateSubscription?.cancel();
    return super.close();
  }
}
