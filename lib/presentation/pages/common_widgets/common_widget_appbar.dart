import 'package:amazonprime/core/colors/colors.dart';
import 'package:amazonprime/core/colors/constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppBarWidget extends StatelessWidget {
  AppBarWidget(
      {super.key,
      this.title,
      required this.isImage,
      required this.goldencolour});
  final String? title;
  bool isImage = false;
  bool goldencolour = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        isImage
            ? Image.asset(
                'assets/images/prime_logo.png',
                width: 90,
                height: 100,
              )
            : Text(
                title!,
                style: goldencolour == true ? appbartextG : appbartextW,
              ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 30,
        ),
        kwidth,
        const Icon(
          Icons.account_circle,
          color: Colors.white,
          size: 40,
        ),
      ],
    );
  }
}
