import 'package:bmi_calculator/bmi.dart';
import 'package:bmi_calculator/components/Button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/constants/styles.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.height, required this.weight})
      : super(key: key);

  final int height;
  final int weight;

  @override
  Widget build(BuildContext context) {
    final calculator = BMI(height: height, weight: weight);

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Your Results",
                style: kNumberLabelStyle.copyWith(fontSize: 34.0),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Expanded(
                child: ReusableCard(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          calculator.getResult().toUpperCase(),
                          style: kNumberLabelStyle.copyWith(
                              fontSize: 24.0, color: Colors.green),
                        ),
                        Text(
                          calculator.getBMI(),
                          style: kNumberLabelStyle.copyWith(fontSize: 100.0),
                        ),
                        Text(
                          calculator.getInterpretation(),
                          style: kLableStyle,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    color: kActiveCardColor),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Button(
                text: "TRY AGAIN",
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}
