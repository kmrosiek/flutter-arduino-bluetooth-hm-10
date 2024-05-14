import 'package:flutter/material.dart';
import 'package:flutter_ble_sample/application/locker_cubit/locker_cubit.dart';
import 'package:flutter_ble_sample/presentation/home/locker_widget/locker_animation_mixin.dart';
import 'package:flutter_ble_sample/presentation/home/locker_widget/speech_recognition_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationWidget extends StatefulWidget {
  const LottieAnimationWidget({super.key});

  @override
  _LottieAnimationWidgetState createState() => _LottieAnimationWidgetState();
}

class _LottieAnimationWidgetState extends State<LottieAnimationWidget>
    with
        SingleTickerProviderStateMixin,
        LockerAnimationMixin<LottieAnimationWidget>,
        SpeechRecognitionMixin<LottieAnimationWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LockerCubit, LockerState>(
      listener: (context, state) {
        print(state);
        state.when(
            unresolved: () {
              playToBeginning();
              startListening();
            },
            success: () => playOpened(),
            failure: () => playBlink());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Expanded(
                  child: TextField(keyboardType: TextInputType.number)),
              ElevatedButton(onPressed: () {}, child: const Text('Try'))
            ],
          ),
          Lottie.asset('assets/lock_animation.json',
              height: 80,
              controller: controller,
              onLoaded: (composition) =>
                  controller.duration = composition.duration),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () =>
                context.read<LockerCubit>().tryToOpen(lockerPin: 1),
            child: const Text('Play'),
          ),
          ElevatedButton(
            onPressed: () => context.read<LockerCubit>().reset(),
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}
