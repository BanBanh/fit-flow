import 'package:flutter/material.dart';

ValueNotifier<bool> init = ValueNotifier(true);

ValueNotifier<bool> pageTopDecorNotifier = ValueNotifier(false);
ValueNotifier<bool> refreshNotifier = ValueNotifier(false);
ValueNotifier<Color> screenCurtainColorNotifier = ValueNotifier(
  Colors.transparent,
);

ValueNotifier<double> navIndicatorPosNotifier = ValueNotifier(0);
ValueNotifier<int> navSelectedNotifier = ValueNotifier(0);
ValueNotifier<String> navTitleNotifier = ValueNotifier('Exercises');
ValueNotifier<bool> navBlockerNotifier = ValueNotifier(false);

ValueNotifier<String> topBarTitleNotifier = ValueNotifier('Exercises');

ValueNotifier<int> verticalPageNotifier = ValueNotifier(0);
ValueNotifier<ScrollController> verticalControllerNotifier = ValueNotifier(
  ScrollController(),
);
ValueNotifier<ScrollController> bottomHorizontalControllerNotifier =
    ValueNotifier(ScrollController());
ValueNotifier<ScrollController> topHorizontalControllerNotifier = ValueNotifier(
  ScrollController(),
);
