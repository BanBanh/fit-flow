import 'package:fit_flow/data/notifier.dart';
import 'package:fit_flow/screens/page/account_page.dart';
import 'package:fit_flow/screens/page/detail_page.dart';
import 'package:fit_flow/screens/page/history_page.dart';
import 'package:fit_flow/screens/page/index_page.dart';
import 'package:fit_flow/screens/page/search_page.dart';
import 'package:fit_flow/screens/page/setting_page.dart';
import 'package:fit_flow/screens/page/work_out_page.dart';
import 'package:flutter/material.dart';

class PageTurner extends StatelessWidget {
  const PageTurner({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double pageWidth = screenWidth - 48;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double pageHeight = screenHeight - 24 - 48 - 24 - 72 - 24;
    return ValueListenableBuilder(
      valueListenable: pageTopDecorNotifier,
      builder: (context, pageTopDecor, child) {
        return ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(24),
          child: SizedBox(
            width: pageTopDecor ? pageWidth : screenWidth,
            height: pageHeight,
            child: ValueListenableBuilder(
              valueListenable: verticalControllerNotifier,
              builder: (context, verticalController, child) {
                return SingleChildScrollView(
                  controller: verticalController,
                  physics: NeverScrollableScrollPhysics(),
                  reverse: true,
                  child: Column(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: topHorizontalControllerNotifier,
                        builder: (context, topHorizontalController, child) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: topHorizontalController,
                            physics: NeverScrollableScrollPhysics(),
                            child: Row(
                              children: [
                                SizedBox(width: 24),
                                DetailPage(),
                                SizedBox(width: 24),
                                AccountPage(),
                                SizedBox(width: 24),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 24),
                      ValueListenableBuilder(
                        valueListenable: bottomHorizontalControllerNotifier,
                        builder: (context, bottomHorizontalController, child) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: bottomHorizontalController,
                            physics: NeverScrollableScrollPhysics(),
                            child: Row(
                              children: [
                                SizedBox(width: 24),
                                IndexPage(),
                                SizedBox(width: 24),
                                SearchPage(),
                                SizedBox(width: 24),
                                WorkOutPage(),
                                SizedBox(width: 24),
                                HistoryPage(),
                                SizedBox(width: 24),
                                SettingPage(),
                                SizedBox(width: 24),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
