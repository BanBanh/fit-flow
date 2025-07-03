import 'package:fit_flow/data/my_decor.dart';
import 'package:fit_flow/logic/logic.dart';
import 'package:flutter/material.dart';

class TopBarBackBtn extends StatelessWidget {
  const TopBarBackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.themeMode;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double pageHeight = screenHeight - 24 - 48 - 24 - 72 - 24;
    return GestureDetector(
      onTap: () => handleVerticalPageController(0, pageHeight),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: MyDecor(isDarkMode).bgLight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Icon(
            Icons.keyboard_arrow_up,
            color: MyDecor(isDarkMode).text,
            size: 36,
          ),
        ),
      ),
    );
  }
}
