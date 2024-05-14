enum LockStatus {
  unlocked,
  locked,
  restarted,
}

extension LockStatusExtension on LockStatus {
  int get code {
    switch (this) {
      case LockStatus.unlocked:
        return 50;
      case LockStatus.locked:
        return 0;
      case LockStatus.restarted:
        return 51;
    }
  }
}
