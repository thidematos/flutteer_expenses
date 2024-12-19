import 'package:flutter_expenses/models/month.dart';

class Saving {
  Saving();

  double sumSavings(List<Month> months) {
    double sum = 0;

    for (final month in months) {
      sum += month.finalValue;
    }

    return sum;
  }
}
