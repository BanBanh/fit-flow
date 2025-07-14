import 'dart:async';

import 'package:fit_flow/data/notifier.dart';
import 'package:flutter/material.dart';

void handleVerticalPageController(int selected, double pageHeight) {
  // 1: top
  // 0: bottom
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
