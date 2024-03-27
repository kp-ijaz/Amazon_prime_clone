import 'package:amazonprime/core/colors/colors.dart';
import 'package:flutter/material.dart';

import 'presentation/pages/splashscreen/splashcreen.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          primaryColor: Colors.indigo,
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white))),
      home: const SplashScreenpage(),
    );
  }
}
