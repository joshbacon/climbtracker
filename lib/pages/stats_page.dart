import 'package:climb_tracker/widgets/charts/pie_chart.dart';
import 'package:climb_tracker/widgets/charts/radar_chart.dart';
import 'package:flutter/material.dart';

// TODO:
// - use the fl_chart library (https://pub.dev/packages/fl_chart)
// - add a date filter (limit from earliest entered date to today)

// - pie chart for distribution
// - also radar chart for this
// - number of each color over time:
// -- line chart
// -- scatter chart

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stats"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Pie(),
              Radar()
            ],
          ),
        ),
      )
    );
  }
}