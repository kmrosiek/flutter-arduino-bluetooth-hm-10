import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_ble_sample/presentation/common/exceptions/pretty_exception.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_state.dart';
part 'connection_cubit.freezed.dart';

class ConnectionCubit extends Cubit<ConnectionState> {
  ConnectionCubit() : super(const ConnectionState.connected());

  final BluetoothDevice device = BluetoothDevice(
      remoteId: const DeviceIdentifier('772c42a6-ba1a-40c2-a432-27936eafa798'));
  StreamSubscription<BluetoothConnectionState>? _connectionStateSubscription;

  void listenToConnectionState() {
    if (_connectionStateSubscription != null) return;
    _connectionStateSubscription =
        device.connectionState.listen((connectionState) async {
      print('ConnectionState: $connectionState');
      if (connectionState == BluetoothConnectionState.connected) {
        //_services = []; // must rediscover services
        emit(const ConnectionState.connected());
      }
      if (connectionState == BluetoothConnectionState.connected) {
        //&&_rssi == null) {
        //_rssi = await device.readRssi();
      }
      /*if (mounted) {
        setState(() {});
      }*/
    });
  }

  void connect() async {
    print('connecting');
    //emit(const ConnectionState.connecting());
    try {
      //await device.connect(timeout: const Duration(seconds: 2));

      emit(state.nextState());
    } catch (e) {
      log(Pretty.exception('Exception when connecting:', e));
      emit(const ConnectionState.disconnected(message: 'Could not connect.'));
    }
  }

  @override
  Future<void> close() {
    _connectionStateSubscription?.cancel();
    return super.close();
  }
}
