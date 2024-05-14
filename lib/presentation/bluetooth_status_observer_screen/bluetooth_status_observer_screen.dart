// Copyright 2017-2023, Charles Weinberger & Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ble_sample/presentation/bluetooth_off_screen/bluetooth_off_screen.dart';
import 'package:flutter_ble_sample/presentation/bluetooth_status_observer_screen/bluetooth_adapter_state_observer.dart';
import 'package:flutter_ble_sample/presentation/home/home.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothStatusObserverScreen extends StatefulWidget {
  const BluetoothStatusObserverScreen({super.key});

  @override
  State<BluetoothStatusObserverScreen> createState() =>
      _BluetoothStatusObserverScreenState();
}

class _BluetoothStatusObserverScreenState
    extends State<BluetoothStatusObserverScreen> {
  BluetoothAdapterState _adapterState = BluetoothAdapterState.unknown;

  late StreamSubscription<BluetoothAdapterState> _adapterStateStateSubscription;

  @override
  void initState() {
    super.initState();
    _adapterStateStateSubscription =
        FlutterBluePlus.adapterState.listen((state) {
      _adapterState = state;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _adapterStateStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = _adapterState == BluetoothAdapterState.on
        ? const Home()
        : BluetoothOffScreen(adapterState: _adapterState);

    return MaterialApp(
      color: Colors.lightBlue,
      home: screen,
      navigatorObservers: [BluetoothAdapterStateObserver()],
    );
  }
}
