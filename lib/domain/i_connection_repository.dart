import 'package:dartz/dartz.dart';
import 'package:flutter_ble_sample/domain/ble_characteristic.dart/ble_characteristic.dart';
import 'package:flutter_ble_sample/domain/ble_connection_state.dart';

abstract class IConnectionRepository {
  Stream<BLEConnectionState> listenToConnectionState();
  Either<String, BLECharacteristic> get getBLECharacteristic;
  Future<Either<String, Unit>> connect();
  Future<void> discoverServices();
  void close();
}
