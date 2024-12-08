import 'package:mortgage_calculator/domain/payment_type.dart';

abstract class LoanCalculatorEvent {
  const LoanCalculatorEvent();
}

class CalculatorInitEvent extends LoanCalculatorEvent {}

class CalculatorPaymentTypeChangeEvent extends LoanCalculatorEvent {
  final PaymentType type;
  const CalculatorPaymentTypeChangeEvent({required this.type});
}

class CalculatorTotalAmountChangedEvent extends LoanCalculatorEvent {
  final int amount;
  const CalculatorTotalAmountChangedEvent({required this.amount});
}

class CalculatorLoanPeriodChangedEvent extends LoanCalculatorEvent {
  final int period;
  const CalculatorLoanPeriodChangedEvent({required this.period});
}

class CalculatorRateChangedEvent extends LoanCalculatorEvent {
  final double rate;
  const CalculatorRateChangedEvent({required this.rate});
}
