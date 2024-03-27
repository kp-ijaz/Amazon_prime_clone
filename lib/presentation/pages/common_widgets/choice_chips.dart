import 'package:amazonprime/core/colors/colors.dart';
import 'package:amazonprime/core/colors/constant.dart';
import 'package:flutter/material.dart';

class ChoiceChips extends StatelessWidget {
  const ChoiceChips({super.key, required this.chiptext});
  final List<String> chiptext;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        ChoiceChip.elevated(
          label: Text(
            chiptext[0].toString(),
            style: const TextStyle(color: textColor),
          ),
          selected: true,
          showCheckmark: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          disabledColor: Colors.amber,
          selectedColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        kwidth,
        ChoiceChip.elevated(
          labelStyle:
              const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          label: Text(
            chiptext[1].toString(),
            style: const TextStyle(color: Colors.white),
          ),
          color: const MaterialStatePropertyAll(Colors.black),
          selected: false,
          showCheckmark: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          selectedColor: Colors.blue,
        ),
        kwidth,
        ChoiceChip.elevated(
          label: Text(chiptext[2].toString()),
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          selected: false,
          showCheckmark: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          disabledColor: const Color.fromARGB(255, 0, 0, 0),
          selectedColor: Colors.blue,
        ),
      ],
    );
  }
}
