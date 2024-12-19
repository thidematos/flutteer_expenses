import 'package:flutter/material.dart';
import 'package:flutter_expenses/main.dart';
import 'package:flutter_expenses/models/expense.dart';
import 'package:flutter_expenses/models/month.dart';
import 'package:flutter_expenses/utils/format_date.dart';

class CreateExpense extends StatefulWidget {
  const CreateExpense(this.currentMonth, this.onCreateExpense, {super.key});

  final void Function(Expense expense) onCreateExpense;

  final Month currentMonth;

  @override
  State<StatefulWidget> createState() {
    return _CreateExpenseState();
  }
}

class _CreateExpenseState extends State<CreateExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedCategory = 'Alimentação';

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _openDatePicker() async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = DateTime(now.year - 1, now.month, now.day);
    final DateTime? pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  bool _validateInputs() {
    bool status = true;
    if (_titleController.text.isEmpty ||
        _amountController.text.isEmpty ||
        _selectedDate == null ||
        _selectedCategory == null) {
      status = !status;
    }

    return status;
  }

  void _showErrorMessage() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(
            'Falha ao criar despesa',
            style: const TextStyle().copyWith(
              color: const Color.fromARGB(255, 178, 48, 39),
            ),
          ),
          content: const Text(
              'Por favor, entre com todas as informações para criar uma despesa!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Tentar novamente'),
            )
          ],
        );
      },
    );
  }

  void _newExpense() {
    if (!_validateInputs()) {
      _showErrorMessage();
      return;
    }

    widget.onCreateExpense(Expense(
        title: _titleController.text,
        amount: double.parse(_amountController.text),
        category: kCategories.firstWhere(
            (category) => category['name'] as String == _selectedCategory),
        date: _selectedDate!));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 56),
      child: Column(
        children: [
          Text(
            widget.currentMonth.month.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle().copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _titleController,
                  style: const TextStyle().copyWith(
                    color: const Color.fromARGB(255, 34, 34, 34),
                  ),
                  decoration: const InputDecoration(
                    label: Text('Despesa:'),
                  ),
                ),
              ),
              const SizedBox(width: 48),
              Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? 'Selecione uma data'
                        : formatDate(_selectedDate!),
                    style: const TextStyle().copyWith(
                      fontSize: 12,
                    ),
                  ),
                  IconButton(
                      onPressed: _openDatePicker,
                      icon: const Icon(Icons.date_range))
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  style: const TextStyle().copyWith(
                    color: const Color.fromARGB(255, 34, 34, 34),
                  ),
                  decoration: const InputDecoration(
                    prefix: Icon(Icons.monetization_on),
                    label: Text('Valor'),
                  ),
                ),
              ),
              const SizedBox(
                width: 48,
              ),
              DropdownButton(
                value: _selectedCategory,
                items: kCategories
                    .map(
                      (category) => DropdownMenuItem(
                        value: category['name'] as String,
                        child: Text(
                          category['name'] as String,
                          style: const TextStyle().copyWith(
                            color: const Color.fromARGB(255, 36, 36, 36),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(kColorTheme.onPrimaryContainer),
                ),
                onPressed: () {
                  _newExpense();
                  print(_titleController.text);
                  print(_amountController.text);
                  print(_selectedCategory);
                  print(_selectedDate);
                },
                child: Text(
                  'Criar despesa!',
                  style: const TextStyle().copyWith(
                    color: const Color.fromARGB(255, 110, 231, 183),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
