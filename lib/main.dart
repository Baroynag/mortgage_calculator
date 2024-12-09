import 'package:flutter/material.dart';
import 'package:mortgage_calculator/loan_calculator/loan_calculator_screen.dart';
import 'package:mortgage_calculator/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getAppTheme(),
      home: const LoanCalculatorScreen(),
    );
  }
}
