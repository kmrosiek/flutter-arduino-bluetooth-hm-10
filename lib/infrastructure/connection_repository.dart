import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_ble_sample/domain/ble_characteristic.dart/ble_characteristic.dart';
import 'package:flutter_ble_sample/domain/ble_connection_state.dart';
import 'package:flutter_ble_sample/domain/i_connection_repository.dart';
import 'package:flutter_ble_sample/infrastructure/exceptions/pretty_exception.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ConnectionRepository implements IConnectionRepository {
  ConnectionRepository();
  static const String deviceId = String.fromEnvironment('BLE_DEVICE_ID');
  final BluetoothDevice device =
      BluetoothDevice(remoteId: const DeviceIdentifier(deviceId));
  StreamSubscription<BluetoothConnectionState>? _connectionStateSubscription;
  final StreamController<BLEConnectionState> _connectionStateController =
      StreamController<BLEConnectionState>();

  static const String serviceIdStr128 = '0000ffe0-0000-1000-8000-00805f9b34fb';
  static const String characteristicIdStr128 =
      '0000ffe1-0000-1000-8000-00805f9b34fb';

  @override
  Stream<BLEConnectionState> listenToConnectionState() async* {
    if (_connectionStateSubscription != null) _connectionStateController.stream;
    _connectionStateSubscription =
        device.connectionState.listen((connectionState) {
      if (connectionState == BluetoothConnectionState.connected) {
        _connectionStateController.add(BLEConnectionState.connected);
      } else if (connectionState == BluetoothConnectionState.disconnected) {
        _connectionStateController.add(BLEConnectionState.disconnected);
      }
    });
    yield* _connectionStateController.stream;
  }

  @override
  void close() {
    _connectionStateController.close();
    _connectionStateSubscription?.cancel();
  }

  @override
  Future<Either<String, Unit>> connect() async {
    try {
      await device.connect(timeout: const Duration(seconds: 5));
      return const Right(unit);
    } catch (e) {
      log(Pretty.exception('Exception when connecting:', e));
      return Left(Pretty.exception('', e));
    }
  }

  @override
  Either<String, BLECharacteristic> get getBLECharacteristic {
    try {
      final service = device.servicesList.firstWhere(
          (service) => service.serviceUuid.str128 == serviceIdStr128);
      final characteristic = service.characteristics.firstWhere(
          (characteristic) =>
              characteristic.characteristicUuid.str128 ==
              characteristicIdStr128);
      return Right(BLECharacteristic(
          remoteId: device.remoteId.str,
          serviceId: characteristic.serviceUuid.str128,
          characteristicId: characteristic.characteristicUuid.str128));
    } catch (e) {
      final errorMessage =
          Pretty.exception('Could not get characteristics ', e);
      log(errorMessage);
      return Left(errorMessage);
    }
  }

  @override
  Future<void> discoverServices() async {
    await device.discoverServices();
  }
}
