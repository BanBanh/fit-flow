// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fit_flow/data/model/user_preferences.dart';
import 'package:fit_flow/data/my_decor.dart';

class CListItem extends StatelessWidget {
  const CListItem({
    super.key,
    this.imgPath = '',
    this.iconData,
    this.title = '',
    this.widgets,
    this.imgColor,
  });

  final String imgPath;
  final Color? imgColor;
  final String title;
  final List<Widget>? widgets;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.themeMode;

    final double screenWidth = MediaQuery.of(context).size.width;
    Color primaryColor = MyDecor(isDarkMode).primaryColor;
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
                child: iconData != null
                    ? Icon(
                        iconData,
                        color: imgColor ?? MyDecor(isDarkMode).text,
                        size: 36,
                      )
                    : Image.asset(
                        imgPath,
                        fit: BoxFit.contain,
                        color: imgColor ?? MyDecor(isDarkMode).text,
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
                  ...widgets ?? [],
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
  const CListItemItem({
    super.key,
    this.bgColor = '',
    this.textColor = '',
    this.borderColor = '',
    this.text = '',
  });
  final String bgColor;
  final String textColor;
  final String borderColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.themeMode;
    Color bgC = MyDecor(isDarkMode).bg;
    Color borderC = MyDecor(isDarkMode).border;
    Color textC = MyDecor(isDarkMode).text;
    switch (textColor) {
      case 'dark':
        {
          textC = MyDecor(true).text;
        }
      case 'light':
        {
          textC = MyDecor(false).text;
        }
      case 'system':
        {
          final bool platformBrightness =
              MediaQuery.of(context).platformBrightness == Brightness.dark;
          textC = MyDecor(platformBrightness).text;
        }
      case 'blue':
        textC = MyDecor(isDarkMode).blue;
      case 'purple':
        textC = MyDecor(isDarkMode).purple;
      case 'red':
        textC = MyDecor(isDarkMode).red;
      case 'orange':
        textC = MyDecor(isDarkMode).orange;
      case 'yellow':
        textC = MyDecor(isDarkMode).yellow;
      case 'green':
        textC = MyDecor(isDarkMode).green;
      default:
    }
    switch (bgColor) {
      case 'dark':
        {
          bgC = MyDecor(true).bg;
        }
      case 'light':
        {
          bgC = MyDecor(false).bg;
        }
      case 'system':
        {
          final bool platformBrightness =
              MediaQuery.of(context).platformBrightness == Brightness.dark;
          bgC = MyDecor(platformBrightness).bg;
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
    switch (borderColor) {
      case 'dark':
        {
          borderC = MyDecor(true).border;
        }
      case 'light':
        {
          borderC = MyDecor(false).border;
        }
      case 'system':
        {
          final bool platformBrightness =
              MediaQuery.of(context).platformBrightness == Brightness.dark;
          borderC = MyDecor(platformBrightness).border;
        }
      case 'blue':
        borderC = MyDecor(isDarkMode).blue;
      case 'purple':
        borderC = MyDecor(isDarkMode).purple;
      case 'red':
        borderC = MyDecor(isDarkMode).red;
      case 'orange':
        borderC = MyDecor(isDarkMode).orange;
      case 'yellow':
        borderC = MyDecor(isDarkMode).yellow;
      case 'green':
        borderC = MyDecor(isDarkMode).green;
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
