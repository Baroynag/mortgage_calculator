import 'package:flutter/material.dart';
import 'package:mortgage_calculator/loan_calculator/loan_calculator_screen_theme.dart';
import 'package:mortgage_calculator/widgets/calcultor_payment_card_theme.dart';

LoanCalculatorTheme getLoanCalculatorTheme() {
  return const LoanCalculatorTheme(
      errorTextStyle: TextStyle(color: Colors.red, fontSize: 14),
      errorTextPadding: EdgeInsets.all(8),
      padding: EdgeInsets.all(24),
      rowSpacing: 16);
}

CalculatorPaymentCardTheme getCalculatorPaymentCardTheme() {
  return CalculatorPaymentCardTheme(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.lightBlue.withOpacity(0.7),
    ),
    selectorPadding: const EdgeInsets.all(4),
    selectorDecoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    borderRadius: BorderRadius.circular(16),
    fillColor: Colors.lightBlue,
    selectedColor: Colors.black,
    selectorTextPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
    fieldPadding: const EdgeInsets.all(8.0),
    spacing: 16,
    textMaxLines: 1,
  );
}

ThemeData getAppTheme() {
  return ThemeData(
    useMaterial3: false,
    extensions: <ThemeExtension<dynamic>>[
      getLoanCalculatorTheme(),
      getCalculatorPaymentCardTheme(),
    ],
  );
}
