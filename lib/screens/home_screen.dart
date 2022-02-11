import 'package:bmi_calculator/components/Button.dart';
import 'package:bmi_calculator/components/circle_button.dart';
import 'package:bmi_calculator/components/icon_card.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/constants/styles.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int height = 120;
  int weight = 50;
  int age = 14;
  Gender? selectedGenderCard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedGenderCard = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      color: selectedGenderCard == Gender.male
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      child:
                          const IconCard(iconData: Icons.male, label: "Male"),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 14.0,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedGenderCard = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      color: selectedGenderCard == Gender.female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      child: const IconCard(
                          iconData: Icons.female, label: "Female"),
                    ),
                  ),
                )
              ],
            )),
            const SizedBox(
              height: 24.0,
            ),
            Expanded(
              flex: 1,
              child: ReusableCard(
                color: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "HEIGHT",
                      style: kLableStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberLabelStyle,
                        ),
                        const Text(
                          "cm",
                          style: kLableStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        activeTrackColor: kPrimaryTextColor,
                        inactiveTrackColor: kSecondaryTextColor,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 18.0,
                        ),
                        overlayColor: Color(0x29EA1556),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: kPrimaryColor,
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 50,
                          max: 220,
                          onChanged: (value) {
                            setState(() {
                              height = value.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT",
                            style: kLableStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberLabelStyle,
                          ),
                          Row(
                            // mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  icon: Icons.remove),
                              CircleButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon: Icons.add)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 14.0,
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "AGE",
                            style: kLableStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberLabelStyle,
                          ),
                          Row(
                            // mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  icon: Icons.remove),
                              CircleButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  icon: Icons.add)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Button(
              text: "CALCULATE",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      height: height,
                      weight: weight,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
