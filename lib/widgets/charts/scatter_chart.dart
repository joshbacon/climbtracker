import 'package:climb_tracker/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Scatter extends StatelessWidget {
  const Scatter(
    this.numGreen,
    this.numYellow,
    this.numOrange,
    this.numBlue,
    this.numRed,
    this.numPurple,
    this.numPink,
    this.numGrey,
    {Key? key}) : super(key: key
  );

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
      width: 150.0,
      height: 150.0,
      child: ScatterChart(
        ScatterChartData(
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(
            border: Border(
              top: BorderSide(color: lightTheme),
              right: BorderSide(color: lightTheme),
              bottom: BorderSide(color: lightTheme),
              left: BorderSide(color: lightTheme),
            )
          ),
          minX: 0.0, maxX: 2.25,
          minY: 0.0, maxY: 2.25,
          scatterSpots: [
            ScatterSpot( 0.25, 0.25, dotPainter: FlDotCirclePainter(radius:  numGreen.toDouble()*3, color: green  )),
            ScatterSpot(  0.5,  0.5, dotPainter: FlDotCirclePainter(radius: numYellow.toDouble()*3, color: yellow )),
            ScatterSpot( 0.75, 0.75, dotPainter: FlDotCirclePainter(radius: numOrange.toDouble()*3, color: orange )),
            ScatterSpot(  1.0,  1.0, dotPainter: FlDotCirclePainter(radius:   numBlue.toDouble()*3, color: blue   )),
            ScatterSpot( 1.25, 1.25, dotPainter: FlDotCirclePainter(radius:    numRed.toDouble()*3, color: red    )),
            ScatterSpot(  1.5,  1.5, dotPainter: FlDotCirclePainter(radius: numPurple.toDouble()*3, color: purple )),
            ScatterSpot( 1.75, 1.75, dotPainter: FlDotCirclePainter(radius:   numPink.toDouble()*3, color: pink   )),
            ScatterSpot(    2,    2, dotPainter: FlDotCirclePainter(radius:   numGrey.toDouble()*3, color: grey   )),
          ]         
        ),
        swapAnimationDuration: const Duration(milliseconds: 150),
        swapAnimationCurve: Curves.linear, 
      )
    );
  }
}