import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorClass {
  errorLottie() {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Lottie.asset('assets/images/error.json'),
          const Text(
            'API Error',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10),
          )
        ],
      ),
    );
  }
}
