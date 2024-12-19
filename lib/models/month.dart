import 'package:flutter_expenses/models/expense.dart';

class Month {
  Month({
    required this.month,
    required this.startValue,
  }) : finalValue = startValue;

  final String month;
  final double startValue;
  double finalValue;
  final List<Expense> expenses = [];
}
