import 'package:climb_tracker/models/colors.dart';
import 'package:climb_tracker/widgets/charts/pie_chart.dart';
import 'package:flutter/material.dart';

class PieLegend extends StatelessWidget {
  const PieLegend(
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
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: Container(
        color: lightGrey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: SizedBox(
            width: 255.0,
            height: 200.0,
            child: Row(
              children: [
                Pie(
                  numGreen,
                  numYellow,
                  numOrange,
                  numBlue,
                  numRed,
                  numPurple,
                  numPink,
                  numGrey,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.square_rounded, color: green),
                        const SizedBox(width: 5.0),
                        Text(numGreen.toString(), style: TextStyle(color: offWhite)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.square_rounded, color: yellow),
                        const SizedBox(width: 5.0),
                        Text(numYellow.toString(), style: TextStyle(color: offWhite)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.square_rounded, color: orange),
                        const SizedBox(width: 5.0),
                        Text(numOrange.toString(), style: TextStyle(color: offWhite)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.square_rounded, color: blue),
                        const SizedBox(width: 5.0),
                        Text(numBlue.toString(), style: TextStyle(color: offWhite)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.square_rounded, color: red),
                        const SizedBox(width: 5.0),
                        Text(numRed.toString(), style: TextStyle(color: offWhite)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.square_rounded, color: purple),
                        const SizedBox(width: 5.0),
                        Text(numPurple.toString(), style: TextStyle(color: offWhite)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.square_rounded, color: pink),
                        const SizedBox(width: 5.0),
                        Text(numPink.toString(), style: TextStyle(color: offWhite)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.square_rounded, color: grey),
                        const SizedBox(width: 5.0),
                        Text(numGrey.toString(), style: TextStyle(color: offWhite)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}