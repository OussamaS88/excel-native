import 'package:excel_native/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DonutAutoLabelChart extends StatelessWidget {
  final List<charts.Series<LinearSales, String>> seriesList;
  final bool animate;

  DonutAutoLabelChart(this.seriesList, {this.animate = false});

  /// Creates a [PieChart] with sample data and no transition.
  factory DonutAutoLabelChart.withSampleData() {
    return DonutAutoLabelChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.PieChart<String>(seriesList,
        animate: animate,
        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        //
        // [ArcLabelDecorator] will automatically position the label inside the
        // arc if the label will fit. If the label will not fit, it will draw
        // outside of the arc with a leader line. Labels can always display
        // inside or outside using [LabelPosition].
        //
        // Text style for inside / outside can be controlled independently by
        // setting [insideLabelStyleSpec] and [outsideLabelStyleSpec].
        //
        // Example configuring different styles for inside/outside:
        //       new charts.ArcLabelDecorator(
        //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
        //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
        defaultRenderer: charts.ArcRendererConfig(
            arcWidth: 60, arcRendererDecorators: [charts.ArcLabelDecorator()]));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, String>> _createSampleData() {
    final data = [
      LinearSales(0, 100),
      LinearSales(1, 75),
      LinearSales(2, 25),
      LinearSales(3, 5),
    ];

    return [
      charts.Series<LinearSales, String>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year.toString(),
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class DonutAutoLabelChartAgeStats extends StatelessWidget {
  final List<charts.Series<AgeStatistics, String>> seriesList;
  final bool animate;

  DonutAutoLabelChartAgeStats(this.seriesList, {this.animate = false});

  @override
  Widget build(BuildContext context) {
    return charts.PieChart<String>(seriesList,
        animate: animate,
        defaultRenderer: charts.ArcRendererConfig(
            arcWidth: 60, arcRendererDecorators: [charts.ArcLabelDecorator()]));
  }
}

class DonutAutoLabelChartFamilyStats extends StatelessWidget {
  final List<charts.Series<AgeStatistics, String>> seriesList;
  final bool animate;

  DonutAutoLabelChartFamilyStats(this.seriesList, {this.animate = false});

  @override
  Widget build(BuildContext context) {
    return charts.PieChart<String>(seriesList,
        animate: animate,
        defaultRenderer: charts.ArcRendererConfig(
            arcWidth: 60, arcRendererDecorators: [charts.ArcLabelDecorator()]));
  }
}
