import 'package:flutter/material.dart';

class CalculatorPaymentCardTheme
    extends ThemeExtension<CalculatorPaymentCardTheme> {
  static CalculatorPaymentCardTheme? of(BuildContext context) =>
      Theme.of(context).extension<CalculatorPaymentCardTheme>();

  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final EdgeInsetsGeometry? selectorPadding;
  final Decoration? selectorDecoration;
  final BorderRadius? borderRadius;
  final Color? fillColor;
  final Color? selectedColor;
  final EdgeInsetsGeometry? selectorTextPadding;
  final EdgeInsetsGeometry? fieldPadding;
  final double? spacing;
  final int? textMaxLines;

  const CalculatorPaymentCardTheme({
    this.padding,
    this.decoration,
    this.selectorPadding,
    this.selectorDecoration,
    this.borderRadius,
    this.fillColor,
    this.selectedColor,
    this.selectorTextPadding,
    this.fieldPadding,
    this.spacing,
    this.textMaxLines,
  });

  @override
  ThemeExtension<CalculatorPaymentCardTheme> lerp(
    ThemeExtension<CalculatorPaymentCardTheme>? other,
    double t,
  ) {
    return this;
  }

  @override
  CalculatorPaymentCardTheme copyWith() {
    return const CalculatorPaymentCardTheme();
  }
}
