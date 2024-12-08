import 'package:mortgage_calculator/domain/toggle_info.dart';

enum PaymentType {
  annuity,
  differentiated;

  static List<ToggleInfo<PaymentType>> getTogglesFromPaymentTypes() {
    return PaymentType.values
        .map((e) => ToggleInfo(value: e, title: e.title()))
        .toList();
  }
}

extension PaymentTypeExt on PaymentType {
  String title() {
    switch (this) {
      case PaymentType.annuity:
        return 'Аннуитентный';
      case PaymentType.differentiated:
        return 'Дифференциальный';
    }
  }
}
