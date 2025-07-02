import 'dart:async';

import 'package:fit_flow/data/model/user_preferences.dart';
import 'package:fit_flow/data/my_decor.dart';
import 'package:fit_flow/data/notifier.dart';
import 'package:flutter/material.dart';

void handleTopBarTitle(String targetText) {
  if (topBarTitleNotifier.value == targetText) {
    return;
  }
  List<String> sequence = [];
  int step = 0;
  Timer? timer;
  // Build sequence
  sequence.clear();

  // Remove old text one character at a time
  for (int i = topBarTitleNotifier.value.length; i >= 0; i--) {
    sequence.add(topBarTitleNotifier.value.substring(0, i));
  }

  // Add new text one character at a time
  for (int i = 1; i <= targetText.length; i++) {
    sequence.add(targetText.substring(0, i));
  }

  // Reset step counter
  step = 0;

  // Start timer
  timer = Timer.periodic(Duration(milliseconds: 25), (timer1) {
    if (step < sequence.length) {
      topBarTitleNotifier.value = sequence[step];
      step++;
    } else {
      timer?.cancel();
      timer = null;
    }
  });
}

void handleHorizontalPageController(int selected, double screenWidth) {
  horizontalControllerNotifier.value.animateTo(
    (screenWidth - 24) * selected,
    duration: Duration(milliseconds: 250),
    curve: Curves.easeInOut,
  );
}

void handleThemeChange(String color, BuildContext context) {
  Timer? timer;
  switch (color) {
    case 'dark':
      if (UserPreferences.themeMode != 'dark') {
        screenCertainColorNotifier.value = MyDecor(true).bg;
        timer = Timer(Duration(milliseconds: 750), () {
          UserPreferences.themeMode = 'dark';
          refreshNotifier.value = !refreshNotifier.value;
          screenCertainColorNotifier.value = Colors.transparent;
        });
      }

    case 'light':
      if (UserPreferences.themeMode != 'light') {
        screenCertainColorNotifier.value = MyDecor(false).bg;
        timer = Timer(Duration(milliseconds: 750), () {
          UserPreferences.themeMode = 'light';
          refreshNotifier.value = !refreshNotifier.value;
          screenCertainColorNotifier.value = Colors.transparent;
        });
      }

    case 'system':
      if (UserPreferences.themeMode != 'system') {
        screenCertainColorNotifier.value = MyDecor(
          MediaQuery.of(context).platformBrightness == Brightness.dark,
        ).bg;
        timer = Timer(Duration(milliseconds: 750), () {
          UserPreferences.themeMode = 'system';
          refreshNotifier.value = !refreshNotifier.value;
          screenCertainColorNotifier.value = Colors.transparent;
        });
      }
  }
}
