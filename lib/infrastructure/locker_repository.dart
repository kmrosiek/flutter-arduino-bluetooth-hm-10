import 'dart:async';
import 'dart:developer';

import 'package:flutter_ble_sample/domain/ble_characteristic.dart/ble_characteristic.dart';
import 'package:flutter_ble_sample/domain/i_locker_repository.dart';
import 'package:flutter_ble_sample/domain/lock/lock_status.dart';
import 'package:flutter_ble_sample/infrastructure/bluetooth_characteristic_extension.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class LockerRepository implements ILockerRepository {
  LockerRepository(BLECharacteristic characteristic)
      : _characteristic = BLECharac.fromDomain(characteristic);
  final BluetoothCharacteristic _characteristic;

  BluetoothCharacteristic get c => _characteristic;
  StreamSubscription<List<int>>? _resultsSubscription;
  final StreamController<LockStatus> _resultsController =
      StreamController<LockStatus>();

  @override
  Stream<LockStatus> subscribeToResults() async* {
    if (_resultsSubscription != null) _resultsController.stream;
    await c.setNotifyValue(c.isNotifying == false);
    _resultsSubscription = c.onValueReceived.listen((value) async {
      if (value.isEmpty) {
        log("Received empty value");
        return;
      }

      log('Result update: ${value.first}');
      if (value.first == LockStatus.unlocked.code) {
        _resultsController.add(LockStatus.unlocked);
      } else if (value.first == LockStatus.restarted.code) {
        _resultsController.add(LockStatus.restarted);
      } else {
        _resultsController.add(LockStatus.locked);
      }
    });
    yield* _resultsController.stream;
  }

  @override
  void tryToOpen({required int lockerPin}) {
    c.write([lockerPin], withoutResponse: c.properties.writeWithoutResponse);
  }

  @override
  void close() {
    _resultsController.close();
    _resultsSubscription?.cancel();
  }
}
