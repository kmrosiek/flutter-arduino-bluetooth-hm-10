part of 'locker_cubit.dart';

@freezed
class LockerState with _$LockerState {
  const factory LockerState.beginning() = _Beginning;
  const factory LockerState.unresolved() = _UnResolved;
  const factory LockerState.success() = _Success;
  const factory LockerState.failure() = _Failure;
}
