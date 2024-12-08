enum LoanBoundsError {
  zeroAmountError,
  zeroPeriodError,
  zeroRateError,
  loanPercentError,
}

extension LoanBoundsErrorExt on LoanBoundsError {
  static const Map<LoanBoundsError, String> _errorMessagesText = {
    LoanBoundsError.zeroAmountError:
        'Сумма первоначального взноса не может быть 0',
    LoanBoundsError.zeroPeriodError: 'Период не может быть 0',
    LoanBoundsError.zeroRateError: 'Процент не может быть 0',
    LoanBoundsError.loanPercentError: 'Процент не может превышать 100',
  };

  String get message => _errorMessagesText[this]!;
}
