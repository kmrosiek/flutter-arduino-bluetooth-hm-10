#include "Arduino.h"
#include <SoftwareSerial.h>

const byte rxPin = 8;
const byte txPin = 9;
int pushButton = 7;
int greenLed = 13;
int yellowLed = 12;
int redLed = 11;
const int noOfLeds = 3;
const int ledPins[] = {greenLed, yellowLed, redLed};

SoftwareSerial BTSerial(rxPin, txPin);
int lockerPin = 1;

void setup() {
  pinMode(greenLed, OUTPUT);
  pinMode(yellowLed, OUTPUT);
  pinMode(redLed, OUTPUT);
  pinMode(pushButton, INPUT);

  const int frequency = 9600;
  Serial.begin(frequency);
  while(!Serial) {}
  Serial.println("Serial Start");
  BTSerial.begin(frequency);
  while(!BTSerial) {}
  Serial.println("BTSerial Start");

  randomizeLockerPin();
  updateLEDsToMatchLockerPin();
}

String messageBuffer = "";
String message = "";
char c;
int val;

enum LockStatus {
  locked,
  unlocked,
  restarted
};

const int CHANGE_PIN_BUTTON_STATE = 1;

void loop() {

  if(BTSerial.available()) {
    c = BTSerial.read();
    val = (int)c;
    Serial.write(val);
    if(val == lockerPin) {
      BTSerial.print(unlocked + 1);
      unlockedBlink();
      randomizeLockerPin();
      Serial.println("Guessed");
    } else {
      BTSerial.print(locked + 1);
      notUnlockedBlink();
      Serial.println("Not guessed");
      
    }
  }    

   if(Serial.available()) {
    c = Serial.read();
    if(c == '\n') {
      message = messageBuffer;
      messageBuffer = "";
      Serial.println("Sending to BLE:" + message + ".");
      BTSerial.println(message);
    } else {
      messageBuffer += c;
    }
  }

  delay(200);

  int buttonState = digitalRead(pushButton);
  if(buttonState == CHANGE_PIN_BUTTON_STATE) {
    randomizeLockerPin();
    Serial.println(lockerPin);
    BTSerial.print(restarted + 1);
    updateLEDsToMatchLockerPin();
  }
}

void randomizeLockerPin() {
  const int upperBoundNumberFor3Leds = 8;
  lockerPin = random(0, upperBoundNumberFor3Leds);
  Serial.print("Randomized locker pin: ");
  Serial.println((char)lockerPin);
}

void updateLEDsToMatchLockerPin() {
  for (int i = 0; i < noOfLeds; i++) {
    digitalWrite(ledPins[i], (lockerPin >> i) & 1);
  }
}


void blinkLEDs() {
  digitalWriteForAllLeds(LOW);
  delay(100);
  digitalWriteForAllLeds(HIGH);
  delay(200);
}

void notUnlockedBlink() {
  blinkLEDs();
  updateLEDsToMatchLockerPin();
}

void unlockedBlink() {
  const int noOfBlinksForSuccess = 3;
  for(int i = 0; i < noOfBlinksForSuccess; i++) {
    blinkLEDs();
  }
}

void digitalWriteForAllLeds(int state) {
 for (int i = 0; i < noOfLeds; i++) {
    digitalWrite(ledPins[i], state);
  } 
}