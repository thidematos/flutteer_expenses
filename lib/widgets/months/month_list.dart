import 'package:flutter/material.dart';
import 'package:flutter_expenses/tracker.dart';
import 'package:flutter_expenses/models/month.dart';
import 'package:flutter_expenses/models/saving.dart';
import 'package:flutter_expenses/utils/format_monetary.dart';
import 'package:flutter_expenses/widgets/months/month_item.dart';

class MonthList extends StatelessWidget {
  const MonthList(this.onSelectMonth, {super.key});

  final void Function(Month month) onSelectMonth;

  @override
  Widget build(BuildContext context) {
    final double sumSavings = Saving().sumSavings(kMonths);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 42),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Meses'.toUpperCase(),
                style: const TextStyle().copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.monetization_on),
                  const SizedBox(width: 10),
                  Text(formatValue(sumSavings)),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 400,
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return MonthItem(onSelectMonth, kMonths[index]);
            },
            itemCount: kMonths.length,
          ),
        ),
      ],
    );
  }
}
