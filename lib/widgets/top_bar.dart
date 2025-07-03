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
              SizedBox(child: TopBarBackBtn()),
              Container(
                alignment: Alignment.center,
                child: Text(
                  topBarTitle,
                  style: TextStyle(
                    color: MyDecor(isDarkMode).text,
                    fontSize: 36,
                  ),
                ),
              ),
              SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
