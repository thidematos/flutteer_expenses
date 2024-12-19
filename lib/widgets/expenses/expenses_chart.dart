import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expenses/models/expense.dart';
import 'package:flutter_expenses/utils/format_monetary.dart';

class ExpensesChart extends StatelessWidget {
  const ExpensesChart(this.expenses, {super.key});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: 300,
        child: PieChart(
          PieChartData(
            centerSpaceRadius: 60,
            sections: expenses
                .map(
                  (expense) => PieChartSectionData(
                    color: expense.category['color'] as Color,
                    value: expense.amount,
                    titlePositionPercentageOffset: 2,
                    title: formatValue(expense.amount),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
