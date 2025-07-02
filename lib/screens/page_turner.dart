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

    final ScrollController verticalController = ScrollController(
      initialScrollOffset: pageHeight + 24,
    );
    final ScrollController horizontalController = ScrollController();
    return SizedBox(
      width: screenWidth,
      height: pageHeight,
      child: SingleChildScrollView(
        controller: verticalController,
        child: Column(
          children: [
            DetailPage(),
            SizedBox(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: horizontalController,
              child: Row(
                children: [
                  IndexPage(),
                  SizedBox(width: 24),
                  SearchPage(),
                  SizedBox(width: 24),
                  WorkOutPage(),
                  SizedBox(width: 24),
                  HistoryPage(),
                  SizedBox(width: 24),
                  SettingPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
