import 'package:fit_flow/data/notifier.dart';
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
    final double screenHeight = MediaQuery.of(context).size.height;

    final double pageWidth = screenWidth - 24 - 24;
    final double pageHeight = screenHeight - 24 - 48 - 24 - 72 - 24;
    return SizedBox(
      width: screenWidth,
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
                DetailPage(),
                SizedBox(height: 24),
                ValueListenableBuilder(
                  valueListenable: horizontalControllerNotifier,
                  builder: (context, horizontalController, child) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: horizontalController,
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
    );
  }
}
