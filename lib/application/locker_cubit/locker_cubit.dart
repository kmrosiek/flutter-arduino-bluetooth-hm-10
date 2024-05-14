import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_ble_sample/domain/i_locker_repository.dart';
import 'package:flutter_ble_sample/domain/lock/lock_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'locker_state.dart';
part 'locker_cubit.freezed.dart';

class LockerCubit extends Cubit<LockerState> {
  LockerCubit(this._lockerRepository) : super(const LockerState.unresolved());

  StreamSubscription<LockStatus>? _resultsSubscription;
  final ILockerRepository _lockerRepository;

  void subscribeToLockerResults() async {
    if (_resultsSubscription != null) return;
    _resultsSubscription =
        _lockerRepository.subscribeToResults().listen((result) {
      if (result == LockStatus.unlocked) {
        emit(const LockerState.success());
      } else if (result == LockStatus.restarted) {
        emit(const LockerState.beginning());
      } else {
        emit(const LockerState.failure());
      }
    });
  }

  void tryToOpen({required int lockerPin}) {
    emit(const LockerState.unresolved());
    _lockerRepository.tryToOpen(lockerPin: lockerPin);
  }

  void reset() => emit(const LockerState.beginning());

  @override
  Future<void> close() {
    _resultsSubscription?.cancel();
    return super.close();
  }
}
