import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ble_sample/application/locker_cubit/locker_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

mixin SpeechRecognitionMixin<T extends StatefulWidget> on State<T> {
  final SpeechToText _speechToText = SpeechToText();
  bool speechEnabled = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _speechToText.cancel();
    super.dispose();
  }

  Future<void> _init() async {
    speechEnabled = await _speechToText.initialize();
    if (speechEnabled) {
      startListening();
    } else {
      log('Could not start listerning.');
    }
  }

  void stopListening() async {
    await _speechToText.stop();
    log('Stop listerning to speech');
  }

  void startListening() async {
    await _speechToText.listen(
        onResult: _onSpeechResult,
        listenOptions: SpeechListenOptions(listenMode: ListenMode.search));
    speechEnabled = true;
    log('Started listerning to speech');
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    int? number = _extractFirstNumber(result.recognizedWords);
    log('matched: $number speechEnabled $speechEnabled');
    if (number != null && speechEnabled) {
      speechEnabled = false;
      context.read<LockerCubit>().tryToOpen(lockerPin: number);
    }
  }

  int? _extractFirstNumber(String text) {
    final Map<String, int> numberWords = {
      'zero': 0,
      'one': 1,
      'two': 2,
      'three': 3,
      'four': 4,
      'five': 5,
      'six': 6,
      'seven': 7,
      'eight': 8,
      'nine': 9,
    };
    text = text.toLowerCase();
    RegExp regex = RegExp(numberWords.keys.join('|') + r'|\d');
    Iterable<Match> match = regex.allMatches(text);

    if (match.isEmpty) return null;

    String matchedText = match.last.group(0)!;
    if (numberWords.containsKey(matchedText)) {
      return numberWords[matchedText];
    } else {
      return int.parse(matchedText);
    }
  }
}
