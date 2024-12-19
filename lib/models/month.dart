import 'package:flutter/material.dart';
import 'package:flutter_expenses/models/expense.dart';

class Month {
  Month({
    required this.month,
    required this.startValue,
    required this.color,
  })  : finalValue = startValue,
        expenses = [];

  Month.createDummyExpenses({
    required this.month,
    required this.startValue,
    required this.color,
  })  : finalValue = startValue,
        expenses = [
          Expense(
            title: 'Mercado',
            amount: 55.60,
            category:
                kCategories.firstWhere((item) => item['name'] == 'Alimentação'),
            date: DateTime.now(),
          ),
          Expense(
            title: 'Café - Unifei',
            amount: 1.50,
            category: kCategories.firstWhere((item) => item['name'] == 'Café'),
            date: DateTime.now(),
          ),
          Expense(
            title: 'Aluguel',
            amount: 600,
            category: kCategories.firstWhere((item) => item['name'] == 'Fixo'),
            date: DateTime.now(),
          ),
        ];

  final String month;
  final double startValue;
  final Color color;
  double finalValue;
  final List<Expense> expenses;

  double get expensesSum {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
