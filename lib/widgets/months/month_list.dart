import 'package:flutter/material.dart';
import 'package:flutter_expenses/models/month.dart';
import 'package:flutter_expenses/widgets/months/month_item.dart';

class MonthList extends StatelessWidget {
  final List<Month> months = [
    Month(month: 'Janeiro', startValue: 500),
    Month(month: 'Fevereiro', startValue: 500),
    Month(month: 'Março', startValue: 500),
    Month(month: 'Abril', startValue: 500),
    Month(month: 'Maio', startValue: 500),
    Month(month: 'Junho', startValue: 500),
    Month(month: 'Julho', startValue: 500),
    Month(month: 'Agosto', startValue: 500),
    Month(month: 'Setembro', startValue: 500),
    Month(month: 'Outubro', startValue: 500),
    Month(month: 'Novembro', startValue: 500),
    Month(month: 'Dezembro', startValue: 500),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Meses',
          style: const TextStyle().copyWith(
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 400,
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return MonthItem(months[index]);
            },
            itemCount: months.length,
          ),
        ),
      ],
    );
  }
}
