import 'package:flutter/material.dart' hide ConnectionState;
import 'package:flutter_ble_sample/application/connection_cubit/connection_cubit.dart';
import 'package:flutter_ble_sample/application/locker_cubit/locker_cubit.dart';
import 'package:flutter_ble_sample/presentation/common/constants/app_colors.dart';
import 'package:flutter_ble_sample/presentation/home/locker_widget/locker_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
          child: const Text('Connect to the lock'),
          onPressed: () => context.read<ConnectionCubit>().connect()),
      body: BlocBuilder<ConnectionCubit, ConnectionState>(
        builder: (context, state) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: state.when(
                      connected: () => BlocProvider(
                            create: (context) =>
                                LockerCubit()..subscribeToLockerResults(),
                            child: const LottieAnimationWidget(),
                          ),
                      disconnected: (String? message) => ElevatedButton(
                            child: const Text('Connect to the lock'),
                            onPressed: () =>
                                context.read<ConnectionCubit>().connect(),
                          ),
                      connecting: () =>
                          LoadingAnimationWidget.staggeredDotsWave(
                            color: AppColors.primary,
                            size: 70,
                          )),
                ),
                Visibility(
                    visible: state.messageIfAny != null,
                    child: Text(state.messageIfAny ?? '',
                        style: const TextStyle(fontSize: 18.0))),
              ]);
        },
      ),
    );
  }
}
