import 'package:fit_flow/data/model/user_preferences.dart';
import 'package:fit_flow/data/my_decor.dart';
import 'package:fit_flow/data/notifier.dart';
import 'package:fit_flow/logic/logic.dart';
import 'package:fit_flow/widgets/custom_list_item.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.themeMode;

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double pageWidth = screenWidth - 24 - 24;
    final double pageHeight = screenHeight - 24 - 48 - 24 - 72 - 24;

    return Container(
      width: pageWidth,
      height: pageHeight,
      decoration: BoxDecoration(
        color: MyDecor(isDarkMode).bg,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.all(24),
      child: Column(
        spacing: 24,
        children: [
          CListItem(
            imgPath: 'assets/images/settings/1.png',
            title: 'Theme Mode',
            widgets: [
              GestureDetector(
                onTap: () => handleThemeChange('dark', context),
                child: CListItemItem(text: 'dark', color: 'dark'),
              ),
              GestureDetector(
                onTap: () => handleThemeChange('light', context),
                child: CListItemItem(text: 'light', color: 'light'),
              ),
              GestureDetector(
                onTap: () => handleThemeChange('system', context),
                child: CListItemItem(text: 'system', color: 'system'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
