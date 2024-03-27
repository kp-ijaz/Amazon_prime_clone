import 'dart:async';

import 'package:amazonprime/core/colors/colors.dart';
import 'package:flutter/material.dart';
import '../mainpage/widgets/screen_mainpage.dart';

class SplashScreenpage extends StatefulWidget {
  const SplashScreenpage({super.key});

  @override
  State<SplashScreenpage> createState() => _SplashScreenpageState();
}

class _SplashScreenpageState extends State<SplashScreenpage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () async {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => ScreenMainPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child:
                Center(child: Image.asset('assets/images/primelogo gif.gif'))),
        backgroundColor: backgroundColor);
  }
}
