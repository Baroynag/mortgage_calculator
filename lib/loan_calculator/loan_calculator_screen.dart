import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mortgage_calculator/bloc/loan_calculator_bloc.dart';
import 'package:mortgage_calculator/bloc/loan_calculator_event.dart';
import 'package:mortgage_calculator/bloc/loan_calculator_state.dart';
import 'package:mortgage_calculator/domain/loan_error.dart';
import 'package:mortgage_calculator/helpers/input_formatter.dart';
import 'package:mortgage_calculator/loan_calculator/loan_calculator_screen_theme.dart';
import 'package:mortgage_calculator/widgets/calcultor_payment_card.dart';
import 'package:mortgage_calculator/widgets/input_field.dart';

class LoanCalculatorScreen extends StatelessWidget {
  const LoanCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Кредитный калькулятор')),
        body: BlocProvider(
          create: (context) => LoanCalculatorBloc()..add(CalculatorInitEvent()),
          child: BlocBuilder<LoanCalculatorBloc, BaseLoanCalculatorState>(
            builder: (context, state) {
              if (state is LoanCalculatorState) {
                return _buildContent(context);
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
  ) {
    final theme = LoanCalculatorTheme.of(context);
    final bloc = context.read<LoanCalculatorBloc>();
    final state = bloc.state as LoanCalculatorState;
    final calculator = state.calculator;
    final inputFormatters = [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(9),
    ];
    return Padding(
      padding: theme?.padding ?? EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputField(
              value: calculator.loanAmount.toString(),
              keyboardType: TextInputType.number,
              labelText: 'Сумма кредита',
              inputFormatters: inputFormatters,
              onChanged: (value) {
                bloc.add(
                  CalculatorTotalAmountChangedEvent(
                    amount: int.tryParse(value) ?? 0,
                  ),
                );
              },
            ),
            _fieldDelimiter(theme),
            InputField(
              value: calculator.loanPeriod.toString(),
              keyboardType: TextInputType.number,
              labelText: 'Срок кредита, в месяцах',
              inputFormatters: inputFormatters,
              onChanged: (value) {
                bloc.add(
                  CalculatorLoanPeriodChangedEvent(
                    period: int.tryParse(value) ?? 0,
                  ),
                );
              },
            ),
            _fieldDelimiter(theme),
            InputField(
              value: calculator.rate.toString(),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d{1,2}[,.]?\d{0,2}$'),
                ),
                LengthLimitingTextInputFormatter(5),
                ReplaceCommaFormatter(),
              ],
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              labelText: 'Процентная ставка',
              onChanged: (value) {
                bloc.add(CalculatorRateChangedEvent(
                  rate: double.tryParse(value) ?? 0,
                ));
              },
            ),
            _buildLoanAmountBoundsError(context, theme),
            _fieldDelimiter(theme),
            _buildPaymentInfoCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLoanAmountBoundsError(
    BuildContext context,
    LoanCalculatorTheme? theme,
  ) {
    final bloc = context.read<LoanCalculatorBloc>();
    final state = bloc.state as LoanCalculatorState;
    final calculator = state.calculator;
    final boundError = calculator.loanBoundsError;

    return boundError == null
        ? const SizedBox()
        : Padding(
            padding: theme?.errorTextPadding ?? EdgeInsets.zero,
            child: Text(
              boundError.message,
              style: theme?.errorTextStyle,
            ),
          );
  }

  Widget _buildPaymentInfoCard(BuildContext context) {
    final bloc = context.read<LoanCalculatorBloc>();

    if (bloc.state is LoanCalculatorState) {
      final state = bloc.state as LoanCalculatorState;
      final calculator = state.calculator;

      return CalculatorPaymentCard(
        type: calculator.paymentType,
        loanAmount: calculator.loanAmount,
        monthlyPayment: calculator.resultPayment,
        totalPaymentSum: calculator.totalPaymentSum,
        totalOverPaymentSum: calculator.totalOverPaymentSum,
        onPaymentTypeSelected: (type) {
          bloc.add(CalculatorPaymentTypeChangeEvent(type: type));
        },
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _fieldDelimiter(LoanCalculatorTheme? theme) =>
      SizedBox(height: theme?.rowSpacing);
}
