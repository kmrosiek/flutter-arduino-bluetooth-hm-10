import 'package:flutter/material.dart';

class BluetoothOffScreenTitle extends StatelessWidget {
  const BluetoothOffScreenTitle({super.key, required this.adapterStateString});
  final String? adapterStateString;

  @override
  Widget build(BuildContext context) {
    String? state = adapterStateString?.split(".").last;
    return Text(
      'Bluetooth Adapter is ${state ?? 'not available'}',
      style: Theme.of(context)
          .primaryTextTheme
          .titleSmall
          ?.copyWith(color: Colors.white),
    );
  }
}
