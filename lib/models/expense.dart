enum Categories { alimentacao, transporte, cafe, diversos, trabalho }

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });

  final String title;
  final double amount;
  final Categories category;
  final DateTime date;
}
