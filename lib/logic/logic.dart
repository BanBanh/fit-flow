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

void handleVerticalPageController(int selected, double pageHeight) {
  verticalPageNotifier.value = selected;
  navBlockerNotifier.value = selected == 1 ? true : false;
  pageTopDecorNotifier.value = true;
  bottomHorizontalControllerNotifier.value.jumpTo(
    bottomHorizontalControllerNotifier.value.offset + 24,
  );
  topHorizontalControllerNotifier.value.jumpTo(
    topHorizontalControllerNotifier.value.offset + 24,
  );
  verticalControllerNotifier.value.animateTo(
    (pageHeight + 24) * selected,
    duration: Duration(milliseconds: 250),
    curve: Curves.easeInOut,
  );
  Timer(Duration(milliseconds: 250), () {
    pageTopDecorNotifier.value = false;
    bottomHorizontalControllerNotifier.value.jumpTo(
      bottomHorizontalControllerNotifier.value.offset - 24,
    );
    topHorizontalControllerNotifier.value.jumpTo(
      topHorizontalControllerNotifier.value.offset - 24,
    );
  });
}

void handleBottomHorizontalPageController(int selected, double screenWidth) {
  navBlockerNotifier.value = true;
  Timer(Duration(milliseconds: 250), () => navBlockerNotifier.value = false);
  bottomHorizontalControllerNotifier.value.animateTo(
    (screenWidth - 24) * selected,
    duration: Duration(milliseconds: 250),
    curve: Curves.easeInOut,
  );
}

Future<void> handleTopHorizontalPageController(
  int selected,
  double screenWidth,
) async {
  topHorizontalControllerNotifier.value.jumpTo((screenWidth - 24) * selected);
}

void handleThemeChange(String color, BuildContext context) {
  Timer? timer;
  // TiMer iS noT uSed. Shut up, bro
  timer = Timer(Duration(milliseconds: 1), () {});
  timer.cancel();

  switch (color) {
    case 'dark':
      if (UserPreferences.themeMode != 'dark') {
        screenCurtainColorNotifier.value = MyDecor(true).bg;
        timer = Timer(Duration(milliseconds: 750), () {
          UserPreferences.themeMode = 'dark';
          refreshNotifier.value = !refreshNotifier.value;
          screenCurtainColorNotifier.value = Colors.transparent;
        });
      }

    case 'light':
      if (UserPreferences.themeMode != 'light') {
        screenCurtainColorNotifier.value = MyDecor(false).bg;
        timer = Timer(Duration(milliseconds: 750), () {
          UserPreferences.themeMode = 'light';
          refreshNotifier.value = !refreshNotifier.value;
          screenCurtainColorNotifier.value = Colors.transparent;
        });
      }

    case 'system':
      if (UserPreferences.themeMode != 'system') {
        screenCurtainColorNotifier.value = MyDecor(
          MediaQuery.of(context).platformBrightness == Brightness.dark,
        ).bg;
        timer = Timer(Duration(milliseconds: 750), () {
          UserPreferences.themeMode = 'system';
          refreshNotifier.value = !refreshNotifier.value;
          screenCurtainColorNotifier.value = Colors.transparent;
        });
      }
    case 'blue':
      if (UserPreferences.primaryColor != 'blue') {
        screenCurtainColorNotifier.value = MyDecor(false).blue;
        timer = Timer(Duration(milliseconds: 750), () {
          UserPreferences.primaryColor = 'blue';
          refreshNotifier.value = !refreshNotifier.value;
          screenCurtainColorNotifier.value = Colors.transparent;
        });
      }
    case 'purple':
      if (UserPreferences.primaryColor != 'purple') {
        screenCurtainColorNotifier.value = MyDecor(false).purple;
        timer = Timer(Duration(milliseconds: 750), () {
          UserPreferences.primaryColor = 'purple';
          refreshNotifier.value = !refreshNotifier.value;
          screenCurtainColorNotifier.value = Colors.transparent;
        });
      }
    case 'red':
      if (UserPreferences.primaryColor != 'red') {
        screenCurtainColorNotifier.value = MyDecor(false).red;
        timer = Timer(Duration(milliseconds: 750), () {
          UserPreferences.primaryColor = 'red';
          refreshNotifier.value = !refreshNotifier.value;
          screenCurtainColorNotifier.value = Colors.transparent;
        });
      }
    case 'orange':
      if (UserPreferences.primaryColor != 'orange') {
        screenCurtainColorNotifier.value = MyDecor(false).orange;
        timer = Timer(Duration(milliseconds: 750), () {
          UserPreferences.primaryColor = 'orange';
          refreshNotifier.value = !refreshNotifier.value;
          screenCurtainColorNotifier.value = Colors.transparent;
        });
      }
    case 'yellow':
      if (UserPreferences.primaryColor != 'yellow') {
        screenCurtainColorNotifier.value = MyDecor(false).yellow;
        timer = Timer(Duration(milliseconds: 750), () {
          UserPreferences.primaryColor = 'yellow';
          refreshNotifier.value = !refreshNotifier.value;
          screenCurtainColorNotifier.value = Colors.transparent;
        });
      }
    case 'green':
      if (UserPreferences.primaryColor != 'green') {
        screenCurtainColorNotifier.value = MyDecor(false).green;
        timer = Timer(Duration(milliseconds: 750), () {
          UserPreferences.primaryColor = 'green';
          refreshNotifier.value = !refreshNotifier.value;
          screenCurtainColorNotifier.value = Colors.transparent;
        });
      }
  }
}
