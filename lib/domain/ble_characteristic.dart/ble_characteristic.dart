import 'package:freezed_annotation/freezed_annotation.dart';

part 'ble_characteristic.freezed.dart';

@freezed
abstract class BLECharacteristic with _$BLECharacteristic {
  const factory BLECharacteristic({
    required String remoteId,
    required String serviceId,
    required String characteristicId,
  }) = _BLECharacteristic;
}
