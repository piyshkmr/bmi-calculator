import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/constants/styles.dart';

import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  const IconCard({Key? key, required this.iconData, required this.label})
      : super(key: key);

  final IconData iconData;
  final String label;

  void selectCard() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, size: 80.0, color: kPrimaryTextColor),
        const SizedBox(
          height: 8.0,
        ),
        Text(label, style: kLableStyle)
      ],
    );
  }
}
