import 'package:flutter/material.dart';
import 'package:flutter_expenses/models/expense.dart';
import 'package:flutter_expenses/models/month.dart';
import 'package:flutter_expenses/widgets/expenses/create_expense.dart';
import 'package:flutter_expenses/widgets/expenses/expenses_screen.dart';
import 'package:flutter_expenses/widgets/months/month_chart.dart';
import 'package:flutter_expenses/widgets/months/month_list.dart';

final List<Month> kMonths = [
  Month.createDummyExpenses(
      month: 'Janeiro', startValue: 1200, color: Colors.blue),
  Month(month: 'Fevereiro', startValue: 1200, color: Colors.green),
  Month(month: 'Março', startValue: 1200, color: Colors.orange),
  Month(month: 'Abril', startValue: 1200, color: Colors.purple),
  Month(month: 'Maio', startValue: 1200, color: Colors.pink),
  Month(month: 'Junho', startValue: 1200, color: Colors.grey),
  Month(month: 'Julho', startValue: 1200, color: Colors.teal),
  Month(
      month: 'Agosto',
      startValue: 1200,
      color: const Color.fromARGB(255, 157, 143, 19)),
  Month(month: 'Setembro', startValue: 1200, color: Colors.brown),
  Month(month: 'Outubro', startValue: 1200, color: Colors.cyan),
  Month(month: 'Novembro', startValue: 1200, color: Colors.deepPurple),
  Month(month: 'Dezembro', startValue: 1200, color: Colors.indigo),
];

class Tracker extends StatefulWidget {
  const Tracker({super.key});

  @override
  State<Tracker> createState() {
    return _TrackerState();
  }
}

class _TrackerState extends State<Tracker> {
  Month? currentMonth;

  void selectMonth(Month? month) {
    setState(() {
      currentMonth = month;
    });
  }

  void showModalExpense() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return CreateExpense(currentMonth!, newExpense);
      },
    );
  }

  void newExpense(Expense expense) {
    setState(() {
      currentMonth!.expenses.add(expense);
      currentMonth!.finalValue =
          currentMonth!.startValue - currentMonth!.expensesSum;
    });
  }

  @override
  Widget build(context) {
    List<Widget> actionsButtons = [];
    List<Widget> currentWidgetScreen = [
      MonthList(selectMonth),
      const MonthChart()
    ];

    if (currentMonth != null) {
      actionsButtons = [
        IconButton(
          onPressed: () {
            selectMonth(null);
          },
          icon: const Icon(Icons.keyboard_backspace),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: IconButton(
            onPressed: () {
              showModalExpense();
            },
            icon: const Icon(Icons.add),
          ),
        ),
      ];

      currentWidgetScreen = [ExpensesScreen(currentMonth!)];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Asitracker'),
        ),
        actions: actionsButtons,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: currentWidgetScreen,
      ),
    );
  }
}
