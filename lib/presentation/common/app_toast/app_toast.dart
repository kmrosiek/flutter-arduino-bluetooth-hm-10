import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  static final FToast fToast = FToast();

  static void dispose() => fToast.removeCustomToast();

  static void show(
    BuildContext context,
    String text, {
    Duration toastDuration = const Duration(seconds: 2),
    Color? toastColor,
    bool isError = false,
  }) {
    fToast.init(context);
    fToast.showToast(
      child: Container(
        constraints: const BoxConstraints(minHeight: 65),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: toastColor ?? Colors.blue,
            boxShadow: [
              BoxShadow(
                color: Colors.blue.shade700.withOpacity(0.7),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(0, 12),
              )
            ]),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(text,
                style: TextStyle(
                    color: toastColor == null
                        ? Colors.white
                        : Colors.black.withAlpha(200)))),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: toastDuration,
    );
  }
}
