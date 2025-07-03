import 'package:flutter/material.dart';

ValueNotifier<bool> refreshNotifier = ValueNotifier(false);
ValueNotifier<Color> screenCurtainColorNotifier = ValueNotifier(
  Colors.transparent,
);

ValueNotifier<double> navIndicatorPosNotifier = ValueNotifier(0);
ValueNotifier<String> topBarTitleNotifier = ValueNotifier('Index');
ValueNotifier<int> navSelectedNotifier = ValueNotifier(0);

ValueNotifier<ScrollController> verticalControllerNotifier = ValueNotifier(
  ScrollController(),
);
ValueNotifier<ScrollController> bottomHorizontalControllerNotifier =
    ValueNotifier(ScrollController());
ValueNotifier<ScrollController> topHorizontalControllerNotifier = ValueNotifier(
  ScrollController(),
);
