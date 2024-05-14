import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'locker_state.dart';
part 'locker_cubit.freezed.dart';

class LockerCubit extends Cubit<LockerState> {
  LockerCubit() : super(const LockerState.unresolved());

  StreamSubscription<List<int>>? _listener;
  /*BluetoothCharacteristic characteristic = BluetoothCharacteristic(
      remoteId: DeviceIdentifier(''),
      serviceUuid: Guid('input'),
      characteristicUuid: Guid('input'));*/

  //BluetoothCharacteristic get c => characteristic;

  void subscribeToLockerResults() async {
    /*await c.setNotifyValue(c.isNotifying == false);
    _listener = c.onValueReceived.listen((value) async {
      print("Raw value received: $value");
      if (value.isNotEmpty) {
        if (value.first == 1) {
          // success
        } else {
          // failure
        }
        //String message = utf8.decode(value);
        //_messagebuffer = "$message\n";
        //print("Received message: $message");
      } else {
        print("Received empty value");
      }
    });*/
  }

  void tryToOpen({required int lockerPin}) {
    //c.write([lockerPin], withoutResponse: c.properties.writeWithoutResponse);
    emit(const LockerState.unresolved());
    final random = Random();
    if (random.nextBool()) {
      emit(const LockerState.success());
    } else {
      emit(const LockerState.failure());
    }
  }

  void reset() {
    emit(const LockerState.unresolved());
  }

  @override
  Future<void> close() {
    _listener?.cancel();
    return super.close();
  }
}
