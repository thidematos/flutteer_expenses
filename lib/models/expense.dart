import 'package:flutter/material.dart';
import 'package:flutter_expenses/utils/format_date.dart';

List<Map<String, Object>> kCategories = [
  {
    "name": 'Alimentação',
    "color": Colors.amber,
    "icon": const Icon(Icons.food_bank_rounded)
  },
  {
    "name": 'Transporte',
    "color": Colors.blue,
    "icon": const Icon(Icons.travel_explore)
  },
  {"name": 'Café', "color": Colors.brown, "icon": const Icon(Icons.coffee)},
  {
    "name": 'Diversão',
    "color": Colors.green,
    "icon": const Icon(Icons.party_mode)
  },
  {"name": 'Trabalho', "color": Colors.red, "icon": const Icon(Icons.work)},
  {
    "name": 'Fixo',
    "color": Colors.purple,
    "icon": const Icon(Icons.restart_alt_rounded)
  }
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

  String get formattedDate {
    return formatDate(date);
  }
}
