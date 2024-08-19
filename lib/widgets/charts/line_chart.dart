import 'package:climb_tracker/models/colors.dart';
import 'package:climb_tracker/models/session.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

// TODO:
// - figure out the logic to get the proper bottom titles

class Line extends StatelessWidget {
  const Line(
    this.sessions,
    {Key? key}) : super(key: key
  );

  final List<Session> sessions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      height: 200.0,
      child: LineChart(
        LineChartData(
          backgroundColor: lightGrey,
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(value.toInt().toString(), style: TextStyle(color: offWhite)),
                  );
                }
              )
            ),
            bottomTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: true)
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false)
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false)
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              color: green,
              spots: sessions.indexed.map<FlSpot>(
                (value) => FlSpot(value.$1.toDouble(), value.$2.getGreen().toDouble())
              ).toList(),
            ),
            LineChartBarData(
              isCurved: true,
              color: yellow,
              spots: sessions.indexed.map<FlSpot>(
                (value) => FlSpot(value.$1.toDouble(), value.$2.getYellow().toDouble())
              ).toList(),
            ),
            LineChartBarData(
              isCurved: true,
              color: orange,
              spots: sessions.indexed.map<FlSpot>(
                (value) => FlSpot(value.$1.toDouble(), value.$2.getOrange().toDouble())
              ).toList(),
            ),
            LineChartBarData(
              isCurved: true,
              color: blue,
              spots: sessions.indexed.map<FlSpot>(
                (value) => FlSpot(value.$1.toDouble(), value.$2.getBlue().toDouble())
              ).toList(),
            ),
            LineChartBarData(
              isCurved: true,
              color: red,
              spots: sessions.indexed.map<FlSpot>(
                (value) => FlSpot(value.$1.toDouble(), value.$2.getRed().toDouble())
              ).toList(),
            ),
            LineChartBarData(
              isCurved: true,
              color: purple,
              spots: sessions.indexed.map<FlSpot>(
                (value) => FlSpot(value.$1.toDouble(), value.$2.getPurple().toDouble())
              ).toList(),
            ),
            LineChartBarData(
              isCurved: true,
              color: pink,
              spots: sessions.indexed.map<FlSpot>(
                (value) => FlSpot(value.$1.toDouble(), value.$2.getPink().toDouble())
              ).toList(),
            ),
            LineChartBarData(
              isCurved: true,
              color: grey,
              spots: sessions.indexed.map<FlSpot>(
                (value) => FlSpot(value.$1.toDouble(), value.$2.getGrey().toDouble())
              ).toList(),
            ),
          ]
        ),
      ),
    );
  }
}