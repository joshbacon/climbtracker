import 'package:flutter/material.dart';
import 'package:climb_tracker/models/colors.dart';

class GradeLegend extends StatelessWidget {

  const GradeLegend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: darkGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Color to Grade Legend',
              style: TextStyle(
                color: offWhite,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(Icons.square_rounded, color: green),
                    Icon(Icons.square_rounded, color: yellow),
                    Icon(Icons.square_rounded, color: orange),
                    Icon(Icons.square_rounded, color: blue),
                    Icon(Icons.square_rounded, color: red),
                    Icon(Icons.square_rounded, color: purple),
                    Icon(Icons.square_rounded, color: pink),
                    Icon(Icons.square_rounded, color: grey),
                  ],
                ),
                const SizedBox(width: 10.0),
                Column(
                  children: [
                    Text('VB',    style: TextStyle(color: offWhite, fontSize: 17.0)),
                    Text('V0-V1', style: TextStyle(color: offWhite, fontSize: 17.0)),
                    Text('V2-V3', style: TextStyle(color: offWhite, fontSize: 17.0)),
                    Text('V4-V5', style: TextStyle(color: offWhite, fontSize: 17.0)),
                    Text('V6-V7', style: TextStyle(color: offWhite, fontSize: 17.0)),
                    Text('V8-V9', style: TextStyle(color: offWhite, fontSize: 17.0)),
                    Text('V10+',  style: TextStyle(color: offWhite, fontSize: 17.0)),
                    Text('V?',    style: TextStyle(color: offWhite, fontSize: 17.0)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}