// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ble_characteristic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BLECharacteristic {
  String get remoteId => throw _privateConstructorUsedError;
  String get serviceId => throw _privateConstructorUsedError;
  String get characteristicId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BLECharacteristicCopyWith<BLECharacteristic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BLECharacteristicCopyWith<$Res> {
  factory $BLECharacteristicCopyWith(
          BLECharacteristic value, $Res Function(BLECharacteristic) then) =
      _$BLECharacteristicCopyWithImpl<$Res, BLECharacteristic>;
  @useResult
  $Res call({String remoteId, String serviceId, String characteristicId});
}

/// @nodoc
class _$BLECharacteristicCopyWithImpl<$Res, $Val extends BLECharacteristic>
    implements $BLECharacteristicCopyWith<$Res> {
  _$BLECharacteristicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteId = null,
    Object? serviceId = null,
    Object? characteristicId = null,
  }) {
    return _then(_value.copyWith(
      remoteId: null == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      characteristicId: null == characteristicId
          ? _value.characteristicId
          : characteristicId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BLECharacteristicImplCopyWith<$Res>
    implements $BLECharacteristicCopyWith<$Res> {
  factory _$$BLECharacteristicImplCopyWith(_$BLECharacteristicImpl value,
          $Res Function(_$BLECharacteristicImpl) then) =
      __$$BLECharacteristicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String remoteId, String serviceId, String characteristicId});
}

/// @nodoc
class __$$BLECharacteristicImplCopyWithImpl<$Res>
    extends _$BLECharacteristicCopyWithImpl<$Res, _$BLECharacteristicImpl>
    implements _$$BLECharacteristicImplCopyWith<$Res> {
  __$$BLECharacteristicImplCopyWithImpl(_$BLECharacteristicImpl _value,
      $Res Function(_$BLECharacteristicImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteId = null,
    Object? serviceId = null,
    Object? characteristicId = null,
  }) {
    return _then(_$BLECharacteristicImpl(
      remoteId: null == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      characteristicId: null == characteristicId
          ? _value.characteristicId
          : characteristicId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BLECharacteristicImpl implements _BLECharacteristic {
  const _$BLECharacteristicImpl(
      {required this.remoteId,
      required this.serviceId,
      required this.characteristicId});

  @override
  final String remoteId;
  @override
  final String serviceId;
  @override
  final String characteristicId;

  @override
  String toString() {
    return 'BLECharacteristic(remoteId: $remoteId, serviceId: $serviceId, characteristicId: $characteristicId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BLECharacteristicImpl &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.characteristicId, characteristicId) ||
                other.characteristicId == characteristicId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, remoteId, serviceId, characteristicId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BLECharacteristicImplCopyWith<_$BLECharacteristicImpl> get copyWith =>
      __$$BLECharacteristicImplCopyWithImpl<_$BLECharacteristicImpl>(
          this, _$identity);
}

abstract class _BLECharacteristic implements BLECharacteristic {
  const factory _BLECharacteristic(
      {required final String remoteId,
      required final String serviceId,
      required final String characteristicId}) = _$BLECharacteristicImpl;

  @override
  String get remoteId;
  @override
  String get serviceId;
  @override
  String get characteristicId;
  @override
  @JsonKey(ignore: true)
  _$$BLECharacteristicImplCopyWith<_$BLECharacteristicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
