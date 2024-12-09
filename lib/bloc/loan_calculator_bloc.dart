import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mortgage_calculator/bloc/loan_calculator_event.dart';
import 'package:mortgage_calculator/bloc/loan_calculator_state.dart';
import 'package:mortgage_calculator/domain/loan_calculator.dart';

class LoanCalculatorBloc
    extends Bloc<LoanCalculatorEvent, BaseLoanCalculatorState> {
  final LoanCalculator _calculator = LoanCalculator.defaultCalc();

  LoanCalculatorBloc() : super(BaseLoanCalculatorState()) {
    on<CalculatorInitEvent>(_onInitialEvent);
    on<CalculatorPaymentTypeChangeEvent>(_onPaymentTypeChange);
    on<CalculatorTotalAmountChangedEvent>(_onTotalAmountChanged);
    on<CalculatorLoanPeriodChangedEvent>(_onLoanPeriodChanged);
    on<CalculatorRateChangedEvent>(_onRateChanged);
  }

  FutureOr<void> _onInitialEvent(
    CalculatorInitEvent event,
    Emitter<BaseLoanCalculatorState> emit,
  ) {
    emit(LoanCalculatorState(calculator: _calculator));
  }

  FutureOr<void> _onPaymentTypeChange(
    CalculatorPaymentTypeChangeEvent event,
    Emitter<BaseLoanCalculatorState> emit,
  ) {
    _calculator.paymentType = event.type;
    emit(LoanCalculatorState(calculator: _calculator));
  }

  FutureOr<void> _onTotalAmountChanged(
    CalculatorTotalAmountChangedEvent event,
    Emitter<BaseLoanCalculatorState> emit,
  ) {
    _calculator.totalLoanAmount = event.amount;
    emit(LoanCalculatorState(calculator: _calculator));
  }

  FutureOr<void> _onLoanPeriodChanged(
    CalculatorLoanPeriodChangedEvent event,
    Emitter<BaseLoanCalculatorState> emit,
  ) {
    _calculator.loanPeriod = event.period;
    emit(LoanCalculatorState(calculator: _calculator));
  }

  FutureOr<void> _onRateChanged(
    CalculatorRateChangedEvent event,
    Emitter<BaseLoanCalculatorState> emit,
  ) {
    _calculator.rate = event.rate;
    emit(LoanCalculatorState(calculator: _calculator));
  }
}

extension LoanCalculatorBlocExt on BuildContext {
  LoanCalculatorBloc get loanCalculatorBloc =>
      BlocProvider.of<LoanCalculatorBloc>(this, listen: false);
}
