// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fit_flow/data/model/user_preferences.dart';
import 'package:fit_flow/data/my_decor.dart';

class CListItem extends StatelessWidget {
  const CListItem({
    super.key,
    this.imgPath = '',
    this.title = '',
    this.widgets,
  });

  final String imgPath;
  final String title;
  final List<Widget>? widgets;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.themeMode;

    final double screenWidth = MediaQuery.of(context).size.width;
    Color primaryColor = MyDecor(isDarkMode).blue;
    switch (UserPreferences.primaryColor) {
      case 'blue':
        primaryColor = MyDecor(isDarkMode).blue;
      case 'purple':
        primaryColor = MyDecor(isDarkMode).purple;
      case 'red':
        primaryColor = MyDecor(isDarkMode).red;
      case 'orange':
        primaryColor = MyDecor(isDarkMode).orange;
      case 'yellow':
        primaryColor = MyDecor(isDarkMode).yellow;
      case 'green':
        primaryColor = MyDecor(isDarkMode).green;
    }

    return Container(
      width: screenWidth - 48 - 48,
      constraints: BoxConstraints(minHeight: 96),
      decoration: BoxDecoration(
        color: MyDecor(isDarkMode).bgLight,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(18),
      child: Center(
        child: Row(
          spacing: 18,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: MyDecor(isDarkMode).bgLight,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: MyDecor(isDarkMode).textMuted,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
                boxShadow: [
                  BoxShadow(
                    color: MyDecor(isDarkMode).textMuted,
                    blurRadius: 9,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.contain,
                  color: MyDecor(isDarkMode).text,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Text(
                        'no img',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: MyDecor(isDarkMode).text,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              width: screenWidth - 48 - 48 - 18 * 2 - 60 - 18,
              child: Column(
                spacing: 6,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Wrap(spacing: 6, runSpacing: 6, children: widgets ?? []),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CListItemItem extends StatelessWidget {
  const CListItemItem({super.key, this.color = '', this.text = ''});
  final String color;
  final String text;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.themeMode;
    Color bgC = MyDecor(isDarkMode).bg;
    Color borderC = MyDecor(isDarkMode).border;
    Color textC = MyDecor(isDarkMode).text;
    switch (color) {
      case 'dark':
        {
          bgC = MyDecor(true).bg;
          borderC = MyDecor(true).border;
          textC = MyDecor(true).text;
        }
      case 'light':
        {
          bgC = MyDecor(false).bg;
          borderC = MyDecor(false).border;
          textC = MyDecor(false).text;
        }
      case 'system':
        {
          final bool platformBrightness =
              MediaQuery.of(context).platformBrightness == Brightness.dark;
          bgC = MyDecor(platformBrightness).bg;
          borderC = MyDecor(platformBrightness).border;
          textC = MyDecor(platformBrightness).text;
        }
      case 'blue':
        bgC = MyDecor(isDarkMode).blue;
      case 'purple':
        bgC = MyDecor(isDarkMode).purple;
      case 'red':
        bgC = MyDecor(isDarkMode).red;
      case 'orange':
        bgC = MyDecor(isDarkMode).orange;
      case 'yellow':
        bgC = MyDecor(isDarkMode).yellow;
      case 'green':
        bgC = MyDecor(isDarkMode).green;
      default:
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: bgC,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderC, width: 2),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textC,
        ),
      ),
    );
  }
}
