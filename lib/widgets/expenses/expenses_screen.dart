import 'package:flutter/material.dart';
import 'package:flutter_expenses/models/month.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen(this.currentMonth, {super.key});

  final Month currentMonth;

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> mainContent = widget.currentMonth.expenses.isEmpty
        ? [
            const SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
              child: Text(
                'Não há despesas para esse mês!',
                textAlign: TextAlign.center,
                style: const TextStyle().copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 194, 47, 37),
                ),
              ),
            )
          ]
        : [];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            widget.currentMonth.month.toUpperCase(),
            style: const TextStyle().copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          ...mainContent,
        ],
      ),
    );
  }
}
