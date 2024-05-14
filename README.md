# Flutter to Arduino via Bluetooth

This project demonstrates how to connect a Flutter application to an Arduino via Bluetooth using the HM-10 module.

## Table of Contents
- [Introduction](#introduction)
- [Preview](#preview)
- [Features](#features)
- [App Structure](#project-file-structure)
- [Arduino Circuit](#arduino-circuit)

## Introduction

This project demonstrates how to connect a Flutter application to an Arduino via Bluetooth using the HM-10 module.
The Locker Guessing Game is a unique application where you need to guess a number shown in binary form through LEDs. The twist? You have to speak the number out loud! Utilizing advanced speech recognition, the app captures your spoken response, communicates it to an Arduino device via Bluetooth, and checks if your guess is correct.

## Preview

![Preview of the Flutter application connecting to Arduino](readme_assets/preview.gif)

## Features

- **Speech Recognition**: Speak your guess and let the app do the rest. No typing needed! Done with [speech_to_text](https://pub.dev/packages/speech_to_text)
- **Bluetooth Communication**: Utilizes the [flutter_blue_plus](https://pub.dev/packages/flutter_blue_plus) library for seamless Bluetooth communication.
- **Interactive UI**: Visual feedback enhanced with animations using the [Lottie](https://pub.dev/packages/lottie) library.

## App Structure

You can download and view the project file structure:
![File Structure](readme_assets/file_structure.png).

## Arduino Circuit

Below is the image of the Arduino circuit used in this project.

![Arduino Circuit](readme_assets/arduino_circuit.png)
