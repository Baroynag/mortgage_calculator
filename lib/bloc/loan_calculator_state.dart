import 'package:flutter/material.dart';
import 'package:mortgage_calculator/domain/loan_calculator.dart';

@immutable
abstract class BaseLoanCalculatorState {}

class LoanCalculatorInitialState extends BaseLoanCalculatorState {}

class LoanCalculatorState extends BaseLoanCalculatorState {
  final LoanCalculator calculator;

  LoanCalculatorState({required this.calculator});
}
