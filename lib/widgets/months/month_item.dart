import 'package:flutter/material.dart';
import 'package:flutter_expenses/main.dart';
import 'package:flutter_expenses/models/month.dart';
import 'package:flutter_expenses/utils/format_monetary.dart';

class MonthItem extends StatelessWidget {
  const MonthItem(this.onSelectMonth, this.currentMonth, {super.key});

  final Month currentMonth;

  final Function(Month month) onSelectMonth;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onSelectMonth(currentMonth);
        },
        child: Card(
          color: currentMonth.color,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 36),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  currentMonth.month.toUpperCase(),
                  textAlign: TextAlign.start,
                  style: const TextStyle().copyWith(
                    color: kColorTheme.onTertiary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  'Saldo: ${formatValue(currentMonth.finalValue)}',
                  style: const TextStyle()
                      .copyWith(color: kColorTheme.onTertiary, fontSize: 12),
                )
              ],
            ),
          ),
        ));
  }
}
