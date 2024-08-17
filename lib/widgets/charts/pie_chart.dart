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
              color: Colors.green,
            ),
            PieChartSectionData(
              title: 'yellow',
              value: 10.0,
              color: Colors.yellow,
            ),
            PieChartSectionData(
              title: 'orange',
              value: 10.0,
              color: Colors.orange,
            ),
            PieChartSectionData(
              title: 'blue',
              value: 10.0,
              color: Colors.blue,
            ),
            PieChartSectionData(
              title: 'red',
              value: 10.0,
              color: Colors.red,
            ),
            PieChartSectionData(
              title: 'purple',
              value: 10.0,
              color: Colors.purple,
            ),
            PieChartSectionData(
              title: 'pink',
              value: 10.0,
              color: Colors.pink,
            ),
            PieChartSectionData(
              title: 'grey',
              value: 10.0,
              color: Colors.grey,
            ),
          ]
        ),
        swapAnimationDuration: const Duration(milliseconds: 150),
        swapAnimationCurve: Curves.linear,
      ),
    );
  }
}