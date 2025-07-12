import 'package:fit_flow/data/my_decor.dart';
import 'package:fit_flow/data/notifier.dart';
import 'package:fit_flow/screens/page_turner.dart';
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

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            color: MyDecor(isDarkMode).bgDark,
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                // top bar
                TopBar(),
                // main body
                PageTurner(),
                SizedBox(height: 24),
                // bottom nav
                BottomNav(),
              ],
            ),
          ),
          IgnorePointer(
            child: ValueListenableBuilder(
              valueListenable: screenCurtainColorNotifier,
              builder: (context, screenCurtainColor, child) {
                return AnimatedContainer(
                  width: screenWidth,
                  height: screenHeight,
                  color: screenCurtainColor,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
