import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'locker_state.dart';
part 'locker_cubit.freezed.dart';

class LockerCubit extends Cubit<LockerState> {
  LockerCubit(this.characteristic) : super(const LockerState.unresolved());

  StreamSubscription<List<int>>? _listener;
  final BluetoothCharacteristic characteristic;

  BluetoothCharacteristic get c => characteristic;

  void subscribeToLockerResults() async {
    await c.setNotifyValue(c.isNotifying == false);
    _listener = c.onValueReceived.listen((value) async {
      if (value.isEmpty) {
        log("Received empty value");
        return;
      }

      if (value.first == 49) {
        emit(const LockerState.success());
      } else if (value.first == 50) {
        emit(const LockerState.beginning());
      } else {
        emit(const LockerState.failure());
      }
    });
  }

  void tryToOpen({required int lockerPin}) {
    emit(const LockerState.unresolved());
    c.write([lockerPin], withoutResponse: c.properties.writeWithoutResponse);
  }

  void reset() => emit(const LockerState.beginning());

  @override
  Future<void> close() {
    _listener?.cancel();
    return super.close();
  }
}
