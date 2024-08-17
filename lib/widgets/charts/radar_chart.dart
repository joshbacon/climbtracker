import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Radar extends StatelessWidget {
  const Radar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 200.0,
      child: RadarChart(
        RadarChartData(
          dataSets: [
            RadarDataSet(
              dataEntries: [
                const RadarEntry(value: 10.0),
                const RadarEntry(value: 15.0),
                const RadarEntry(value: 8.0),
                const RadarEntry(value: 9.0),
                const RadarEntry(value: 20.0),
                const RadarEntry(value: 11.0),
              ]
            ),
          ],
        ),
        swapAnimationDuration: const Duration(milliseconds: 150),
        swapAnimationCurve: Curves.linear, 
      )
    );
  }
}