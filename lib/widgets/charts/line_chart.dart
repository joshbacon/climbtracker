import 'package:climb_tracker/models/colors.dart';
import 'package:climb_tracker/models/session.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Line extends StatelessWidget {
  const Line(
    this.sessions,
    this.colorFilters,
    {Key? key}
  ) : super(key: key);

  final List<Session> sessions;
  final List<bool> colorFilters;
  
  String dateToMonth(int date) {
    switch (date){
      case 1:
        return 'JAN';
      case 2:
        return 'FEB';
      case 3:
        return 'MAR';
      case 4:
        return 'APR';
      case 5:
        return 'MAY';
      case 6:
        return 'JUN';
      case 7:
        return 'JUL';
      case 8:
        return 'AUG';
      case 9:
        return 'SEPT';
      case 10:
        return 'OCT';
      case 11:
        return 'NOV';
      default:
        return 'DEC';
    }
  }

  List<Widget> bottomTitles() {

    int dayRange = sessions.last.getDate().difference(sessions.first.getDate()).inDays;
    String titleOne = "";
    String titleTwo = "";
    String titleThree = "";
    String titleFour = "";

    if (dayRange <= 31) { // one month, so return day numbers
      titleOne = sessions.first.getDate().day.toString();
      titleTwo = sessions[sessions.length ~/ 4].getDate().day.toString();
      titleThree = sessions[ sessions.length - sessions.length ~/ 4 - 1].getDate().day.toString();
      titleFour = sessions.last.getDate().day.toString();
    } else if (dayRange <= 365) { // multiple months, so show months
      titleOne = dateToMonth(sessions.first.getDate().month);
      titleTwo = dateToMonth(sessions[sessions.length ~/ 4].getDate().month);
      titleThree = dateToMonth(sessions[sessions.length - sessions.length ~/ 4 - 1].getDate().month);
      titleFour = dateToMonth(sessions.last.getDate().month);
    } else { // must be years, so return years
      titleOne = '${dateToMonth(sessions.first.getDate().month)} ${sessions.first.getDate().year}';
      titleTwo = '${dateToMonth(sessions[sessions.length ~/ 4].getDate().month)} ${sessions[sessions.length ~/ 4].getDate().year}';
      titleThree = '${dateToMonth(sessions[sessions.length - sessions.length ~/ 4 - 1].getDate().month)} ${
        sessions[sessions.length - sessions.length ~/ 4 - 1].getDate().year}';
      titleFour = '${dateToMonth(sessions.first.getDate().month)} ${sessions.last.getDate().year}';
    }

    return [
      Text(   titleOne, style: TextStyle(color: offWhite)),
      Text(   titleTwo, style: TextStyle(color: offWhite)),
      Text( titleThree, style: TextStyle(color: offWhite)),
      Text(  titleFour, style: TextStyle(color: offWhite)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300.0,
          height: 200.0,
          child: LineChart(
            LineChartData(
              backgroundColor: lightGrey,
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    reservedSize: 32.5,
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
                  sideTitles: SideTitles(showTitles: false)
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
                  spots: colorFilters[0] ? sessions.indexed.map<FlSpot>(
                    (value) => FlSpot(value.$1.toDouble(), value.$2.getGreen().toDouble())
                  ).toList() : [],
                ),
                LineChartBarData(
                  isCurved: true,
                  color: yellow,
                  spots: colorFilters[1] ? sessions.indexed.map<FlSpot>(
                    (value) => FlSpot(value.$1.toDouble(), value.$2.getYellow().toDouble())
                  ).toList() : [],
                ),
                LineChartBarData(
                  isCurved: true,
                  color: orange,
                  spots: colorFilters[2] ? sessions.indexed.map<FlSpot>(
                    (value) => FlSpot(value.$1.toDouble(), value.$2.getOrange().toDouble())
                  ).toList() : [],
                ),
                LineChartBarData(
                  isCurved: true,
                  color: blue,
                  spots: colorFilters[3] ? sessions.indexed.map<FlSpot>(
                    (value) => FlSpot(value.$1.toDouble(), value.$2.getBlue().toDouble())
                  ).toList() : [],
                ),
                LineChartBarData(
                  isCurved: true,
                  color: red,
                  spots: colorFilters[4] ? sessions.indexed.map<FlSpot>(
                    (value) => FlSpot(value.$1.toDouble(), value.$2.getRed().toDouble())
                  ).toList() : [],
                ),
                LineChartBarData(
                  isCurved: true,
                  color: purple,
                  spots: colorFilters[5] ? sessions.indexed.map<FlSpot>(
                    (value) => FlSpot(value.$1.toDouble(), value.$2.getPurple().toDouble())
                  ).toList() : [],
                ),
                LineChartBarData(
                  isCurved: true,
                  color: pink,
                  spots: colorFilters[6] ? sessions.indexed.map<FlSpot>(
                    (value) => FlSpot(value.$1.toDouble(), value.$2.getPink().toDouble())
                  ).toList() : [],
                ),
                LineChartBarData(
                  isCurved: true,
                  color: grey,
                  spots: colorFilters[7] ? sessions.indexed.map<FlSpot>(
                    (value) => FlSpot(value.$1.toDouble(), value.$2.getGrey().toDouble())
                  ).toList() : [],
                ),
              ]
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: bottomTitles()
        ),
      ],
    );
  }
}