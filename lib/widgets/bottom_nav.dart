import 'package:fit_flow/data/my_decor.dart';
import 'package:fit_flow/data/notifier.dart';
import 'package:fit_flow/logic/logic.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.themeMode;
    final double screenWidth = MediaQuery.of(context).size.width;
    double bTNSpace = (screenWidth - 48 - 180) / 6;
    // double activeIndicatorPos = (bTNSpace + 18 - 24) + (bTNSpace + 36) * 0;
    if (navIndicatorPosNotifier.value == 0) {
      navIndicatorPosNotifier.value =
          (bTNSpace + 18 - 24) + (bTNSpace + 36) * navSelectedNotifier.value;
    }
    Color primaryColor = MyDecor(isDarkMode).primaryColor;
    final List<String> titleList = [
      'Index',
      'Search',
      'Work out',
      'History',
      'Setting',
    ];
    return ValueListenableBuilder(
      valueListenable: navIndicatorPosNotifier,
      builder: (context, navIndicatorPos, child) {
        return Container(
          width: screenWidth - 48,
          height: 72,
          decoration: BoxDecoration(
            color: MyDecor(isDarkMode).bg,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Stack(
            children: [
              //Active indicator
              AnimatedPositioned(
                top: 12,
                left: navIndicatorPos,
                duration: Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                      [
                            Icons.description,
                            Icons.search,
                            Icons.fitness_center,
                            Icons.calendar_month_outlined,
                            Icons.settings_outlined,
                          ].indexed
                          .map(
                            (item) => ValueListenableBuilder(
                              valueListenable: verticalPageNotifier,
                              builder: (context, verticalPage, child) {
                                return GestureDetector(
                                  onTap: () async {
                                    if (verticalPage == 0) {
                                      setState(() {
                                        navIndicatorPosNotifier.value =
                                            (bTNSpace + 18 - 24) +
                                            (bTNSpace + 36) * item.$1;
                                      });
                                      handleBottomHorizontalPageController(
                                        item.$1,
                                        screenWidth,
                                      );
                                      handleTopBarTitle(titleList[item.$1]);
                                    }
                                  },
                                  child: SizedBox.square(
                                    dimension: 36,
                                    child: Icon(
                                      item.$2,
                                      color: MyDecor(isDarkMode).text,
                                      size: 36,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
