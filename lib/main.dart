import 'package:flutter/material.dart';
import 'package:flutter_ble_sample/application/connection_cubit/connection_cubit.dart';
import 'package:flutter_ble_sample/domain/i_connection_repository.dart';
import 'package:flutter_ble_sample/infrastructure/connection_repository.dart';
import 'package:flutter_ble_sample/presentation/bluetooth_status_observer_screen/bluetooth_status_observer_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final IConnectionRepository _connectionRepository = ConnectionRepository();
  //TODO replace with getit

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter BLE Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider(
            create: (context) => ConnectionCubit(_connectionRepository)
              ..listenToConnectionState(),
            child: const BluetoothStatusObserverScreen()));
  }
}
