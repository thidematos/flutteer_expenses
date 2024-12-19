import 'package:flutter/material.dart';
import 'package:flutter_expenses/models/expense.dart';
import 'package:flutter_expenses/utils/format_monetary.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: expense.category['color'] as Color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              expense.title,
              style: const TextStyle().copyWith(
                color: const Color.fromARGB(255, 239, 238, 238),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatValue(expense.amount),
                  style: const TextStyle().copyWith(
                    color: const Color.fromARGB(255, 232, 231, 231),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    expense.category['icon'] as Widget,
                    const SizedBox(width: 6),
                    Text(
                      expense.formattedDate,
                      style: const TextStyle().copyWith(
                          color: const Color.fromARGB(255, 44, 44, 44),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
