import 'package:flutter/material.dart';

ValueNotifier<bool> pageTopDecorNotifier = ValueNotifier(false);
ValueNotifier<bool> refreshNotifier = ValueNotifier(false);
ValueNotifier<Color> screenCurtainColorNotifier = ValueNotifier(
  Colors.transparent,
);

ValueNotifier<double> navIndicatorPosNotifier = ValueNotifier(0);
ValueNotifier<int> navSelectedNotifier = ValueNotifier(2);
ValueNotifier<String> navTitleNotifier = ValueNotifier('Work Out');
ValueNotifier<bool> navBlockerNotifier = ValueNotifier(false);

ValueNotifier<String> topBarTitleNotifier = ValueNotifier('Work Out');

ValueNotifier<int> verticalPageNotifier = ValueNotifier(1);
ValueNotifier<ScrollController> verticalControllerNotifier = ValueNotifier(
  ScrollController(),
);
ValueNotifier<ScrollController> bottomHorizontalControllerNotifier =
    ValueNotifier(ScrollController());
ValueNotifier<ScrollController> topHorizontalControllerNotifier = ValueNotifier(
  ScrollController(),
);
