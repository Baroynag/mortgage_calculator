import 'package:flutter/material.dart';
import 'package:mortgage_calculator/domain/payment_type.dart';
import 'package:mortgage_calculator/widgets/calcultor_payment_card_theme.dart';

class CalculatorPaymentCard extends StatelessWidget {
  final PaymentType type;
  final int loanAmount;
  final int monthlyPayment;
  final int totalPaymentSum;
  final int totalOverPaymentSum;
  final ValueChanged<PaymentType>? onPaymentTypeSelected;

  const CalculatorPaymentCard({
    super.key,
    required this.type,
    required this.loanAmount,
    required this.monthlyPayment,
    required this.totalPaymentSum,
    required this.totalOverPaymentSum,
    this.onPaymentTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = CalculatorPaymentCardTheme.of(context);
    return Container(
      padding: theme?.padding,
      decoration: theme?.decoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: theme?.selectorPadding,
            decoration: theme?.selectorDecoration,
            child: _buildPaymentTypeSelector1(
              context,
              theme,
            ),
          ),
          SizedBox(height: theme?.spacing),
          ..._buildInfoRows(context, theme),
        ],
      ),
    );
  }

  Widget _buildPaymentTypeSelector1(
    BuildContext context,
    CalculatorPaymentCardTheme? theme,
  ) {
    const supportToggles = PaymentType.values;
    int selectedIndex = supportToggles.indexOf(type);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ToggleButtons(
          isSelected: List<bool>.generate(
            supportToggles.length,
            (index) => index == selectedIndex,
          ),
          onPressed: (index) {
            final selectedType = supportToggles[index];
            onPaymentTypeSelected?.call(selectedType);
          },
          borderRadius: theme?.borderRadius,
          fillColor: theme?.fillColor,
          selectedColor: theme?.selectedColor,
          children: supportToggles.map((paymentType) {
            return Padding(
              padding: theme?.selectorTextPadding ?? EdgeInsets.zero,
              child: Text(paymentType.title()),
            );
          }).toList(),
        ),
      ],
    );
  }

  List<Widget> _buildInfoRows(
    BuildContext context,
    CalculatorPaymentCardTheme? theme,
  ) {
    final infoRows = [
      _buildField(
        context,
        "Ежемесячный платеж",
        monthlyPayment.toString(),
        theme,
      ),
      _buildField(
        context,
        "Cумма кредита",
        loanAmount.toString(),
        theme,
      ),
      _buildField(
        context,
        "Общая сумма выплат по кредиту",
        totalPaymentSum.toString(),
        theme,
      ),
      _buildField(
        context,
        "Сумма переплаты по кредиту",
        totalOverPaymentSum.toString(),
        theme,
      ),
    ];

    return infoRows;
  }

  Widget _buildField(
    BuildContext context,
    String title,
    String description,
    CalculatorPaymentCardTheme? theme,
  ) {
    return Padding(
      padding: theme?.fieldPadding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, maxLines: theme?.textMaxLines),
          Text(description),
        ],
      ),
    );
  }
}
