// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ExpenseCategoryChart extends StatelessWidget {
  Widget build(BuildContext context) {
    // build hardcoded data
    // data should be populated from an api in actual development

    var data = [
      new CategoryExpenses('Transport', 2500, Colors.red),
      new CategoryExpenses('Groceries', 24000, Colors.blue),
      new CategoryExpenses('Entertainment', 30300, Colors.green),
      new CategoryExpenses('Vacation', 12000, Colors.orange),
    ];

    // create data series setting the categories as the domain and amount as the Measure
    // domain the thing being measured
    // Measure: Numerical value being obeserved in this case the amount
    var series = [
      new charts.Series(
          id: 'Sales',
          colorFn: (CategoryExpenses clickData, _) => clickData.color,
          domainFn: (CategoryExpenses clickData, _) => clickData.categories,
          measureFn: (CategoryExpenses clickData, _) => clickData.amount,
          data: data,
          labelAccessorFn: (CategoryExpenses clickData, _) =>
              '\₦${clickData.amount.toString()}'),
    ];

    // create BarChart
    var chart = new charts.BarChart(
      series,
      animate: true,
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      domainAxis: new charts.OrdinalAxisSpec(),
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
class CategoryExpenses {
  final String categories;
  final int amount;
  final charts.Color color;

  CategoryExpenses(this.categories, this.amount, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
