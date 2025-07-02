import 'package:fit_flow/data/model/user_preferences.dart';
import 'package:fit_flow/data/my_decor.dart';
import 'package:fit_flow/widgets/bottom_nav.dart';
import 'package:fit_flow/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.themeMode;

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
    Color secondaryColor = MyDecor(isDarkMode).orange;
    switch (UserPreferences.secondaryColor) {
      case 'blue':
        secondaryColor = MyDecor(isDarkMode).blue;
      case 'purple':
        secondaryColor = MyDecor(isDarkMode).purple;
      case 'red':
        secondaryColor = MyDecor(isDarkMode).red;
      case 'orange':
        secondaryColor = MyDecor(isDarkMode).orange;
      case 'yellow':
        secondaryColor = MyDecor(isDarkMode).yellow;
      case 'green':
        secondaryColor = MyDecor(isDarkMode).green;
    }

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: MyDecor(isDarkMode).bgDark,
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            // top bar
            TopBar(),
            // main body
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Container(
                height: screenHeight - 48 - 72 * 2,
                decoration: BoxDecoration(
                  color: MyDecor(isDarkMode).bg,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                      
                    ],
                  ),
                ),
              ),
            ),
            // bottom nav
            BottomNav(),
          ],
        ),
      ),
    );
  }
}
