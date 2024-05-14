import 'package:flutter/material.dart';
import 'package:flutter_ble_sample/application/connection_cubit/connection_cubit.dart';
import 'package:flutter_ble_sample/presentation/bluetooth_status_observer_screen/bluetooth_status_observer_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter BLE Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider(
            create: (context) => ConnectionCubit()..listenToConnectionState(),
            child: const BluetoothStatusObserverScreen()));
  }
}
