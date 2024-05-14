import 'package:flutter/material.dart';
import 'package:flutter_ble_sample/application/locker_cubit/locker_cubit.dart';
import 'package:flutter_ble_sample/presentation/common/constants/assets.dart';
import 'package:flutter_ble_sample/presentation/home/locker_widget/locker_animation_mixin.dart';
import 'package:flutter_ble_sample/presentation/home/locker_widget/speech_recognition_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class LockerWidget extends StatefulWidget {
  const LockerWidget({super.key});

  @override
  State<LockerWidget> createState() => _LockerWidgetState();
}

class _LockerWidgetState extends State<LockerWidget>
    with
        SingleTickerProviderStateMixin,
        LockerAnimationMixin<LockerWidget>,
        SpeechRecognitionMixin<LockerWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LockerCubit, LockerState>(
      listener: (context, state) {
        state.when(
            beginning: () {
              playToBeginning();
              startListening();
            },
            unresolved: () {},
            success: () {
              playOpened();
              stopListening();
            },
            failure: () async {
              await playBlink();
              speechEnabled = true;
            });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(Assets.lockAnimation,
              controller: controller,
              onLoaded: (composition) =>
                  controller.duration = composition.duration),
        ],
      ),
    );
  }
}
