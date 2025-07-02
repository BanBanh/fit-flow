import 'dart:async';

import 'package:fit_flow/data/notifier.dart';

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
