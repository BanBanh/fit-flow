import 'package:fit_flow/data/model/user_preferences.dart';
import 'package:fit_flow/data/my_decor.dart';
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
    Color primaryColor = MyDecor(isDarkMode).primaryColor;
    return Container(
      width: pageWidth,
      height: pageHeight,
      decoration: BoxDecoration(
        color: MyDecor(isDarkMode).bg,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.all(24),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(18),
        child: SingleChildScrollView(
          child: Column(
            spacing: 24,
            children: [
              GestureDetector(
                onTap: () async {
                  await handleTopHorizontalPageController(1, screenWidth);
                  handleVerticalPageController(1, pageHeight);
                },
                child: CListItem(
                  iconData: Icons.account_circle_outlined,
                  title: 'Account',
                ),
              ),
              CListItem(
                iconData: Icons.brightness_4_outlined,
                title: 'Theme Mode',
                widgets: [
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      GestureDetector(
                        onTap: () => handleThemeChange('dark', context),
                        child: CListItemItem(
                          text: 'dark',
                          bgColor: 'dark',
                          borderColor: UserPreferences.themeMode == 'dark'
                              ? UserPreferences.primaryColor
                              : 'dark',
                          textColor: 'dark',
                        ),
                      ),
                      GestureDetector(
                        onTap: () => handleThemeChange('light', context),
                        child: CListItemItem(
                          text: 'light',
                          bgColor: 'light',
                          borderColor: UserPreferences.themeMode == 'light'
                              ? UserPreferences.primaryColor
                              : 'light',
                          textColor: 'light',
                        ),
                      ),
                      GestureDetector(
                        onTap: () => handleThemeChange('system', context),
                        child: CListItemItem(
                          text: 'system',
                          bgColor: 'system',
                          borderColor: UserPreferences.themeMode == 'system'
                              ? UserPreferences.primaryColor
                              : 'system',
                          textColor: 'system',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              CListItem(
                iconData: Icons.palette_outlined,
                imgColor: primaryColor,
                title: 'Theme Color',
                widgets: [
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children:
                        ['blue', 'purple', 'red', 'orange', 'yellow', 'green']
                            .map(
                              (e) => GestureDetector(
                                onTap: () => handleThemeChange(e, context),
                                child: CListItemItem(
                                  text: e,
                                  textColor: UserPreferences.primaryColor == e
                                      ? e
                                      : UserPreferences.themeMode,
                                  borderColor: UserPreferences.themeMode,
                                  bgColor: UserPreferences.primaryColor == e
                                      ? UserPreferences.themeMode
                                      : e,
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (UserPreferences.weightUnit == 'kg') {
                    UserPreferences.weightUnit = 'lbs';
                  } else {
                    UserPreferences.weightUnit = 'kg';
                  }
                  setState(() {});
                },
                child: CListItem(
                  title: 'Weight Unit',
                  imgPath: 'assets/images/${UserPreferences.weightUnit}.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
