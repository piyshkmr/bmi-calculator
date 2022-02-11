import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CALCULATOR',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: kBgColor,
          elevation: 0.0,
        ),
        scaffoldBackgroundColor: kBgColor,
        primaryColor: kPrimaryColor,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
      },
    );
  }
}
