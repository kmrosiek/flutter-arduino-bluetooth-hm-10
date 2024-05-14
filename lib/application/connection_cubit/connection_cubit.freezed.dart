// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnectionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) disconnected,
    required TResult Function() connecting,
    required TResult Function() connected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? disconnected,
    TResult? Function()? connecting,
    TResult? Function()? connected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? disconnected,
    TResult Function()? connecting,
    TResult Function()? connected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionStateCopyWith<$Res> {
  factory $ConnectionStateCopyWith(
          ConnectionState value, $Res Function(ConnectionState) then) =
      _$ConnectionStateCopyWithImpl<$Res, ConnectionState>;
}

/// @nodoc
class _$ConnectionStateCopyWithImpl<$Res, $Val extends ConnectionState>
    implements $ConnectionStateCopyWith<$Res> {
  _$ConnectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DisconnectedImplCopyWith<$Res> {
  factory _$$DisconnectedImplCopyWith(
          _$DisconnectedImpl value, $Res Function(_$DisconnectedImpl) then) =
      __$$DisconnectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$DisconnectedImplCopyWithImpl<$Res>
    extends _$ConnectionStateCopyWithImpl<$Res, _$DisconnectedImpl>
    implements _$$DisconnectedImplCopyWith<$Res> {
  __$$DisconnectedImplCopyWithImpl(
      _$DisconnectedImpl _value, $Res Function(_$DisconnectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$DisconnectedImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DisconnectedImpl extends _Disconnected {
  const _$DisconnectedImpl({this.message}) : super._();

  @override
  final String? message;

  @override
  String toString() {
    return 'ConnectionState.disconnected(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisconnectedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisconnectedImplCopyWith<_$DisconnectedImpl> get copyWith =>
      __$$DisconnectedImplCopyWithImpl<_$DisconnectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) disconnected,
    required TResult Function() connecting,
    required TResult Function() connected,
  }) {
    return disconnected(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? disconnected,
    TResult? Function()? connecting,
    TResult? Function()? connected,
  }) {
    return disconnected?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? disconnected,
    TResult Function()? connecting,
    TResult Function()? connected,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
  }) {
    return disconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class _Disconnected extends ConnectionState {
  const factory _Disconnected({final String? message}) = _$DisconnectedImpl;
  const _Disconnected._() : super._();

  String? get message;
  @JsonKey(ignore: true)
  _$$DisconnectedImplCopyWith<_$DisconnectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectingImplCopyWith<$Res> {
  factory _$$ConnectingImplCopyWith(
          _$ConnectingImpl value, $Res Function(_$ConnectingImpl) then) =
      __$$ConnectingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectingImplCopyWithImpl<$Res>
    extends _$ConnectionStateCopyWithImpl<$Res, _$ConnectingImpl>
    implements _$$ConnectingImplCopyWith<$Res> {
  __$$ConnectingImplCopyWithImpl(
      _$ConnectingImpl _value, $Res Function(_$ConnectingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConnectingImpl extends _Connecting {
  const _$ConnectingImpl() : super._();

  @override
  String toString() {
    return 'ConnectionState.connecting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) disconnected,
    required TResult Function() connecting,
    required TResult Function() connected,
  }) {
    return connecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? disconnected,
    TResult? Function()? connecting,
    TResult? Function()? connected,
  }) {
    return connecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? disconnected,
    TResult Function()? connecting,
    TResult Function()? connected,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class _Connecting extends ConnectionState {
  const factory _Connecting() = _$ConnectingImpl;
  const _Connecting._() : super._();
}

/// @nodoc
abstract class _$$ConnectedImplCopyWith<$Res> {
  factory _$$ConnectedImplCopyWith(
          _$ConnectedImpl value, $Res Function(_$ConnectedImpl) then) =
      __$$ConnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectedImplCopyWithImpl<$Res>
    extends _$ConnectionStateCopyWithImpl<$Res, _$ConnectedImpl>
    implements _$$ConnectedImplCopyWith<$Res> {
  __$$ConnectedImplCopyWithImpl(
      _$ConnectedImpl _value, $Res Function(_$ConnectedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConnectedImpl extends _Connected {
  const _$ConnectedImpl() : super._();

  @override
  String toString() {
    return 'ConnectionState.connected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) disconnected,
    required TResult Function() connecting,
    required TResult Function() connected,
  }) {
    return connected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? disconnected,
    TResult? Function()? connecting,
    TResult? Function()? connected,
  }) {
    return connected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? disconnected,
    TResult Function()? connecting,
    TResult Function()? connected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class _Connected extends ConnectionState {
  const factory _Connected() = _$ConnectedImpl;
  const _Connected._() : super._();
}
