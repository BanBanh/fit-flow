import 'package:firebase_core/firebase_core.dart';
import 'package:fit_flow/data/constants.dart';
import 'package:fit_flow/data/model/user_preferences.dart';
import 'package:fit_flow/data/my_styles.dart';
import 'package:fit_flow/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();
  await Hive.openBox('userPrefs');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final String themeMode = context.themeMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kColors[themeMode]!['bg'],
        appBar: AppBar(title: Text('fit flow')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(),
            GestureDetector(
              onTap: () {
                print('dark');
                UserPreferences.themeMode = 'dark';
                setState(() {});
              },
              child: Container(
                color: Colors.red,
                width: 50,
                height: 50,
                child: Center(child: Text('dark')),
              ),
            ),
            GestureDetector(
              onTap: () {
                print('light');
                UserPreferences.themeMode = 'light';
                setState(() {});
              },
              child: Container(
                color: Colors.blue,
                width: 50,
                height: 50,
                child: Center(child: Text('light')),
              ),
            ),
            GestureDetector(
              onTap: () {
                print('system');
                UserPreferences.themeMode = 'system';
                setState(() {});
              },
              child: Container(
                color: Colors.yellow,
                width: 50,
                height: 50,
                child: Center(child: Text('system')),
              ),
            ),
            Text(themeMode, style: TextStyle().text(themeMode)),
          ],
        ),
      ),
    );
  }
}
