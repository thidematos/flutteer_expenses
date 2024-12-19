import 'package:flutter/material.dart';

import 'package:flutter_expenses/models/month.dart';
import 'package:flutter_expenses/widgets/expenses/expenses_chart.dart';
import 'package:flutter_expenses/widgets/expenses/expenses_item.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList(this.currentMonth, {super.key});

  final Month currentMonth;

  @override
  State<ExpensesList> createState() {
    return _ExpensesList();
  }
}

class _ExpensesList extends State<ExpensesList> {
  void removeExpense(String key) {
    setState(() {
      widget.currentMonth.expenses.removeWhere((item) => item.title == key);
      widget.currentMonth.finalValue =
          widget.currentMonth.startValue - widget.currentMonth.expensesSum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        children: [
          ExpensesChart(widget.currentMonth.expenses),
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: widget.currentMonth.expenses.length,
              itemBuilder: (ctx, index) {
                return ExpensesItem(
                    widget.currentMonth.expenses[index], removeExpense);
              },
            ),
          ),
        ],
      ),
    );
  }
}
