import 'package:bmi_calculator/constants/colors.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  final void Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(width: 58.0, height: 58.0),
      fillColor: kInActiveCardColor,
      shape: const CircleBorder(),
      // padding: const EdgeInsets.all(18.0),
      child: Icon(
        icon,
        color: kPrimaryTextColor,
      ),
    );
  }
}
