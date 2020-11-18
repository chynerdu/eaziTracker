import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class OverTimeChart extends StatelessWidget {
  Widget build(BuildContext context) {
    // build hardcoded data
    // data should be populated from an api in actual development
    var data = [
      new ExpenseOvertime(new DateTime(2020, 11, 12), 6000),
      new ExpenseOvertime(new DateTime(2020, 11, 13), 5500),
      new ExpenseOvertime(new DateTime(2020, 11, 14), 3600),
      new ExpenseOvertime(new DateTime(2020, 11, 15), 2500),
      new ExpenseOvertime(new DateTime(2020, 11, 16), 9400),
      new ExpenseOvertime(new DateTime(2020, 11, 17), 25000),
      new ExpenseOvertime(new DateTime(2020, 11, 18), 2000),
    ];

    // create data series setting the days as the domain and amount as the Measure
    // domain the thing being measured
    // Measure: Numerical value being obeserved in this case the amount

    var series = [
      new charts.Series(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        domainFn: (ExpenseOvertime sales, _) => sales.days,
        measureFn: (ExpenseOvertime sales, _) => sales.amount,
        data: data,
      ),
    ];

    // create LineChart

    var chart = new charts.TimeSeriesChart(
      series,
      animate: true,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );

    return (Padding(
      padding: new EdgeInsets.all(32.0),
      child: new SizedBox(
        height: 200.0,
        child: chart,
      ),
    ));
  }
}

/// Sample linear data type.
class ExpenseOvertime {
  final DateTime days;
  final int amount;

  ExpenseOvertime(this.days, this.amount);
}
