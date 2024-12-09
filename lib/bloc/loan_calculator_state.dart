import 'package:flutter/material.dart';
import 'package:mortgage_calculator/domain/loan_calculator.dart';

@immutable
class BaseLoanCalculatorState {}

class LoanCalculatorState extends BaseLoanCalculatorState {
  final LoanCalculator calculator;

  LoanCalculatorState({required this.calculator});
}
