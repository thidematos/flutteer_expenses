import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expenses/tracker.dart';

class MonthChart extends StatelessWidget {
  const MonthChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'DESPESAS ANUAIS',
                style: const TextStyle()
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Expanded(
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: kMonths
                          .map(
                            (month) => FlSpot(
                              (kMonths.indexOf(month)).toDouble() + 1,
                              month.expensesSum,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
