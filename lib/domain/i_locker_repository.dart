import 'dart:async';
import 'package:flutter_ble_sample/domain/lock/lock_status.dart';

abstract class ILockerRepository {
  Stream<LockStatus> subscribeToResults();
  void tryToOpen({required int lockerPin});
  void close();
}
