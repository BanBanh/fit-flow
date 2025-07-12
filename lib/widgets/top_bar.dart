import 'package:fit_flow/data/my_decor.dart';
import 'package:fit_flow/data/notifier.dart';
import 'package:fit_flow/widgets/top_bar_back_btn.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.themeMode;
    final double screenWidth = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(
      valueListenable: topBarTitleNotifier,
      builder: (BuildContext context, String topBarTitle, Widget? child) {
        return SizedBox(
          width: screenWidth - 48,
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 36,
                      height: 36,
                      child: ValueListenableBuilder(
                        valueListenable: verticalPageNotifier,
                        builder: (context, verticalPage, child) {
                          return AnimatedOpacity(
                            duration: Duration(milliseconds: 250),
                            opacity: verticalPage == 0 ? 0 : 1,
                            curve: Curves.easeOut,
                            child: TopBarBackBtn(),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 12),
                    SizedBox(width: 36, height: 36),
                  ],
                ),
              ),
              Text(
                topBarTitle,
                style: TextStyle(color: MyDecor(isDarkMode).text, fontSize: 36),
              ),
              SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 36, height: 36),
                    SizedBox(width: 12),
                    SizedBox(width: 36, height: 36),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
