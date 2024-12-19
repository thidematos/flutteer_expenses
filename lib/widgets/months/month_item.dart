import 'package:flutter/material.dart';
import 'package:flutter_expenses/main.dart';
import 'package:flutter_expenses/models/month.dart';
import 'package:flutter_expenses/utils/format_monetary.dart';

class MonthItem extends StatelessWidget {
  MonthItem(this.currentMonth, {super.key});

  final Month currentMonth;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              currentMonth.month,
              style: const TextStyle().copyWith(color: kColorTheme.onTertiary),
            ),
            Text(
              'Saldo: ${formatValue(currentMonth.finalValue)}',
              style: const TextStyle()
                  .copyWith(color: kColorTheme.onTertiary, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
