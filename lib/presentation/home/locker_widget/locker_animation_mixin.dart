import 'package:flutter/material.dart';

mixin LockerAnimationMixin<T extends StatefulWidget>
    on State<T>, SingleTickerProviderStateMixin<T> {
  late AnimationController controller;

  static const double _beforeBlink = 0.26;
  static const double _afterBlink = 0.42;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    controller.animateTo(_beforeBlink,
        duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void initialiseAnimation() {
    controller = AnimationController(vsync: this);
    controller.animateTo(_beforeBlink,
        duration: const Duration(milliseconds: 500));
  }

  void playToBeginning() {
    controller.animateTo(_beforeBlink,
        duration: const Duration(milliseconds: 2000));
  }

  Future<void> playBlink() async {
    controller.value = _beforeBlink;
    await controller
        .animateTo(_afterBlink, duration: const Duration(milliseconds: 500))
        .then((value) => controller.animateBack(_beforeBlink,
            duration: const Duration(milliseconds: 500)));
  }

  void playOpened() {
    controller.value = _beforeBlink;
    controller.animateTo(1.0, duration: const Duration(milliseconds: 2500));
  }
}
