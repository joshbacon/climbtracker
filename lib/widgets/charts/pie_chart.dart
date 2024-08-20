import 'package:climb_tracker/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Pie extends StatelessWidget {
  const Pie(
    this.numGreen,
    this.numYellow,
    this.numOrange,
    this.numBlue,
    this.numRed,
    this.numPurple,
    this.numPink,
    this.numGrey,
    {Key? key}
  ) : super(key: key);

  final int numGreen;
  final int numYellow;
  final int numOrange;
  final int numBlue;
  final int numRed;
  final int numPurple;
  final int numPink;
  final int numGrey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 200.0,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 35.0,
          startDegreeOffset: 180.0,
          sections: [
            PieChartSectionData(
              title: '',
              value: numGreen.toDouble(),
              color: green,
            ),
            PieChartSectionData(
              title: '',
              value: numYellow.toDouble(),
              color: yellow,
            ),
            PieChartSectionData(
              title: '',
              value: numOrange.toDouble(),
              color: orange,
            ),
            PieChartSectionData(
              title: '',
              value: numBlue.toDouble(),
              color: blue,
            ),
            PieChartSectionData(
              title: '',
              value: numRed.toDouble(),
              color: red,
            ),
            PieChartSectionData(
              title: '',
              value: numPurple.toDouble(),
              color: purple,
            ),
            PieChartSectionData(
              title: '',
              value: numPink.toDouble(),
              color: pink,
            ),
            PieChartSectionData(
              title: '',
              value: numGrey.toDouble(),
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