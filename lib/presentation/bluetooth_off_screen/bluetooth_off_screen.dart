import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ble_sample/presentation/bluetooth_off_screen/widgets/bluetooth_off_screen_title.dart';
import 'package:flutter_ble_sample/presentation/common/app_toast/app_toast.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({super.key, this.adapterState});

  final BluetoothAdapterState? adapterState;

  Widget buildBluetoothOffIcon(BuildContext context) {
    return const Icon(
      Icons.bluetooth_disabled,
      size: 200.0,
      color: Colors.white54,
    );
  }

  Widget buildTurnOnButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        child: const Text('TURN ON'),
        onPressed: () async {
          try {
            if (Platform.isAndroid) {
              await FlutterBluePlus.turnOn();
            }
          } catch (e) {
            if (context.mounted) {
              AppToast.show(context, "Error Turning On: $e");
            }
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildBluetoothOffIcon(context),
            BluetoothOffScreenTitle(
                adapterStateString: adapterState?.toString()),
            if (Platform.isAndroid) buildTurnOnButton(context),
          ],
        ),
      ),
    );
  }
}
