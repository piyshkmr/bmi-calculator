import 'package:bmi_calculator/constants/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: kPrimaryTextColor, fontSize: 18.0),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 20.0)),
          backgroundColor: MaterialStateProperty.all(kPrimaryColor),
        ));
  }
}
