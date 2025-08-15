import 'package:firebase_core/firebase_core.dart';
import 'package:fit_flow/data/notifier.dart';
import 'package:fit_flow/firebase_options.dart';
import 'package:fit_flow/screens/main_screen.dart';
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
    return ValueListenableBuilder(
      valueListenable: refreshNotifier,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
        );
      },
    );
  }
}
// TODO: 
// change category to List or something else than enum
//    so user can add or delete category
//    exercises that have no category become uncategorized
// add Id to exercises
// review that data structure of deepseek suggestion