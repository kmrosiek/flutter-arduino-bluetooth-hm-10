import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ble_sample/presentation/common/app_toast/app_toast.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothTurnOnAndroidButton extends StatelessWidget {
  const BluetoothTurnOnAndroidButton({super.key});

  @override
  Widget build(BuildContext context) {
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
}
