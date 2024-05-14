import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

extension Pretty on Exception {
  static String exception(String prefix, dynamic e) {
    if (e is FlutterBluePlusException) {
      return "$prefix ${e.description}";
    } else if (e is PlatformException) {
      return "$prefix ${e.message}";
    }
    return prefix + e.toString();
  }
}
