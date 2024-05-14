import 'package:flutter_ble_sample/domain/ble_characteristic.dart/ble_characteristic.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

extension BLECharac on BluetoothCharacteristic {
  static BluetoothCharacteristic fromDomain(BLECharacteristic characteristic) {
    return BluetoothCharacteristic(
        remoteId: DeviceIdentifier(characteristic.remoteId),
        serviceUuid: Guid(characteristic.serviceId),
        characteristicUuid: Guid(characteristic.characteristicId));
  }
}
