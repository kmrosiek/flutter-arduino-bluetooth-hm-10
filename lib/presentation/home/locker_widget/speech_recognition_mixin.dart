import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ble_sample/application/locker_cubit/locker_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

mixin SpeechRecognitionMixin<T extends StatefulWidget> on State<T> {
  SpeechToText _speechToText = SpeechToText();

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final bool speechEnabled = await _speechToText.initialize();
    if (speechEnabled) {
      startListening();
    } else {
      log('Could not start listerning.');
    }
  }

  void _stopListening() async {
    await _speechToText.stop();
  }

  void startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    print(result.recognizedWords);
    int? number = _extractFirstNumber(result.recognizedWords);
    if (number != null) {
      _stopListening();
      context.read<LockerCubit>().tryToOpen(lockerPin: number);
    }
  }

  int? _extractFirstNumber(String text) {
    RegExp regex = RegExp(r'\d+');
    Match? match = regex.firstMatch(text);

    if (match == null) return null;

    return int.parse(match.group(0)!);
  }
}
