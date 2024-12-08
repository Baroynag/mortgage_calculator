import 'dart:math';
import 'package:mortgage_calculator/domain/loan_error.dart';
import 'package:mortgage_calculator/domain/loan_defaults.dart';
import 'package:mortgage_calculator/domain/payment_type.dart';

class LoanCalculator {
  PaymentType paymentType;

  LoanCalculator({
    required int loanAmount,
    required int loanPeriod,
    required double rate,
    this.paymentType = PaymentType.annuity,
  })  : _loanAmount = loanAmount,
        _loanPeriod = loanPeriod,
        _rate = rate;

  //  Сумма кредита
  int _loanAmount;
  int get loanAmount => _loanAmount;
  set totalLoanAmount(int? value) {
    _loanAmount = (value != null && value >= 0) ? value : 0;
  }

  // Период кредита в месяцах
  int _loanPeriod;
  int get loanPeriod => _loanPeriod;
  set loanPeriod(int? value) {
    _loanPeriod = (value != null && value > 0) ? value : 0;
  }

  // Ствка
  double _rate;
  double get rate => _rate;
  set rate(double? value) {
    _rate = (value != null && value >= 0) ? value : 0;
  }

  // Ежемесячный платеж
  int get resultPayment => paymentType == PaymentType.annuity
      ? evalAnnuityPayment()
      : evalDifferentiatedPayment();

  //Общая сумма кредита
  int get totalPaymentSum {
    return resultPayment * loanPeriod;
  }

  // Сумма переплаты по кредиту
  int get totalOverPaymentSum {
    return resultPayment * loanPeriod - loanAmount;
  }

  LoanBoundsError? get loanBoundsError {
    if (loanAmount == 0) {
      return LoanBoundsError.zeroAmountError;
    }
    if (loanPeriod == 0) {
      return LoanBoundsError.zeroPeriodError;
    }
    if (rate == 0) {
      return LoanBoundsError.zeroRateError;
    }
    if (rate > 100) {
      return LoanBoundsError.loanPercentError;
    }
    return null;
  }

  int evalAnnuityPayment() {
    final r = rate / 1200;
    if (loanPeriod <= 0 || loanAmount <= 0) return 0;
    final p = pow(1 + r, loanPeriod);
    final numerator = r * p;
    final denominator = p - 1;
    if (denominator == 0) return 0;
    final resultPayment = loanAmount * numerator / denominator;
    return resultPayment.isFinite ? resultPayment.floor() : 0;
  }

  int evalDifferentiatedPayment() {
    final S = loanAmount;
    final r = rate / 1200;
    final N = loanPeriod;
    if (N <= 0 || S <= 0) return 0;
    const n = 1;
    final P = S / N + r * (S - S / N * (n - 1));
    return P.isFinite ? P.floor() : 0;
  }

  factory LoanCalculator.defaultCalc() => LoanCalculator(
        loanAmount: LoanDefaults.defaultSum,
        rate: LoanDefaults.defaultRate,
        loanPeriod: LoanDefaults.defaultPeriod,
      );

  LoanCalculator copyWith({
    double? rate,
    int? loanAmount,
    int? loanPeriod,
    PaymentType? paymentType,
  }) {
    return LoanCalculator(
      rate: rate ?? this.rate,
      loanAmount: loanAmount ?? this.loanAmount,
      loanPeriod: loanPeriod ?? this.loanPeriod,
      paymentType: paymentType ?? this.paymentType,
    );
  }
}
