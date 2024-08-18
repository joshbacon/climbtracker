import 'package:climb_tracker/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Pie extends StatelessWidget {
  const Pie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 200.0,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 40.0,
          sections: [
            PieChartSectionData(
              title: 'green',
              value: 10,
              color: green,
            ),
            PieChartSectionData(
              title: 'yellow',
              value: 10.0,
              color: yellow,
            ),
            PieChartSectionData(
              title: 'orange',
              value: 10.0,
              color: orange,
            ),
            PieChartSectionData(
              title: 'blue',
              value: 10.0,
              color: blue,
            ),
            PieChartSectionData(
              title: 'red',
              value: 10.0,
              color: red,
            ),
            PieChartSectionData(
              title: 'purple',
              value: 10.0,
              color: purple,
            ),
            PieChartSectionData(
              title: 'pink',
              value: 10.0,
              color: pink,
            ),
            PieChartSectionData(
              title: 'grey',
              value: 10.0,
              color: grey,
            ),
          ]
        ),
        swapAnimationDuration: const Duration(milliseconds: 150),
        swapAnimationCurve: Curves.linear,
      ),
    );
  }
}