import 'package:flutter/material.dart';

List<Map<String, Object>> kCategories = [
  {"name": 'Alimentação', "color": Colors.amber},
  {"name": 'Transporte', "color": Colors.blue},
  {"name": 'Café', "color": Colors.brown},
  {"name": 'Diversão', "color": Colors.green},
  {"name": 'Trabalho', "color": Colors.red},
  {"name": 'Fixo', "color": Colors.purple}
];

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });

  final String title;
  final double amount;
  final Map<String, Object> category;
  final DateTime date;
}
