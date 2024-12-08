import 'package:flutter/material.dart';
import 'package:mortgage_calculator/domain/payment_type.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.lightBlue.withOpacity(0.7),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: _buildPaymentTypeSelector(context),
          ),
          const SizedBox(height: 16),
          ..._buildInfoRows(context),
        ],
      ),
    );
  }

  Widget _buildPaymentTypeSelector(BuildContext context) {
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
          borderRadius: BorderRadius.circular(16),
          fillColor: Colors.lightBlue,
          selectedColor: Colors.black,
          children: supportToggles.map((paymentType) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(paymentType.title()),
            );
          }).toList(),
        ),
      ],
    );
  }

  List<Widget> _buildInfoRows(BuildContext context) {
    final infoRows = [
      _buildField(
        context,
        "Ежемесячный платеж",
        monthlyPayment.toString(),
      ),
      _buildField(
        context,
        "Cумма кредита",
        loanAmount.toString(),
      ),
      _buildField(
        context,
        "Общая сумма выплат по кредиту",
        totalPaymentSum.toString(),
      ),
      _buildField(
        context,
        "Сумма переплаты по кредиту",
        totalOverPaymentSum.toString(),
      ),
    ];
    return infoRows;
  }

  Widget _buildField(
    BuildContext context,
    String title,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text(title, maxLines: 1), Text(description)],
      ),
    );
  }
}
