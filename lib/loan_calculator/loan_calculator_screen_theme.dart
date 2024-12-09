import 'package:flutter/material.dart';

class LoanCalculatorTheme extends ThemeExtension<LoanCalculatorTheme> {
  static LoanCalculatorTheme? of(BuildContext context) =>
      Theme.of(context).extension<LoanCalculatorTheme>();

  final TextStyle? errorTextStyle;
  final EdgeInsetsGeometry? errorTextPadding;
  final EdgeInsetsGeometry? padding;
  final double? rowSpacing;

  const LoanCalculatorTheme({
    this.errorTextStyle,
    this.errorTextPadding,
    this.padding,
    this.rowSpacing,
  });

  @override
  ThemeExtension<LoanCalculatorTheme> lerp(
    ThemeExtension<LoanCalculatorTheme>? other,
    double t,
  ) {
    return this;
  }

  @override
  ThemeExtension<LoanCalculatorTheme> copyWith() {
    throw UnimplementedError();
  }
}
