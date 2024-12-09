enum LoanBoundsError {
  zeroAmountError,
  zeroPeriodError,
  zeroRateError,
  loanPercentError,
}

extension LoanBoundsErrorExt on LoanBoundsError {
  String errorText() {
    switch (this) {
      case LoanBoundsError.zeroAmountError:
        return 'Сумма первоначального взноса не может быть 0';
      case LoanBoundsError.zeroPeriodError:
        return 'Период не может быть 0';
      case LoanBoundsError.zeroRateError:
        return 'Процент не может быть 0';
      case LoanBoundsError.loanPercentError:
        return 'Процент не может превышать 100';
    }
  }
}
