import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MonthChart extends StatelessWidget {
  const MonthChart({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(color: Colors.amber),
        ],
      ),
    );
  }
}
