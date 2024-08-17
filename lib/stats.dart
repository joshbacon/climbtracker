import 'package:flutter/material.dart';

// TODO:
// - use the fl_chart library (https://pub.dev/packages/fl_chart)
// - add a date filter (limit from earliest entered date to today)

// - pie chart for distribution
// - also radar chart for this
// - number of each color over time:
// -- line chart
// -- scatter chart

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stats"),
      ),
      body: const Center(
        child: Column(
          children: [
            Text("Graphs will go here", style: TextStyle(color: Colors.white)),
          ],
        ),
      )
    );
  }
}