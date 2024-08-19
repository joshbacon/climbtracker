import 'package:flutter/material.dart';
import 'package:climb_tracker/models/session.dart';
import 'package:climb_tracker/widgets/charts/pie_chart_legend.dart';
import 'package:climb_tracker/widgets/charts/line_chart.dart';

// TODO:
// - add more graphs
// - have it show a note if there are no sessions entered yet (like list page)

class StatsPage extends StatelessWidget {
  const StatsPage(this.sessions, {Key? key}) : super(key: key);

  final List<Session> sessions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stats"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Center(
                child: PieLegend(
                  sessions.fold<int>(0, (prev, session) => prev + session.getGreen()),
                  sessions.fold<int>(0, (prev, session) => prev + session.getYellow()),
                  sessions.fold<int>(0, (prev, session) => prev + session.getOrange()),
                  sessions.fold<int>(0, (prev, session) => prev + session.getBlue()),
                  sessions.fold<int>(0, (prev, session) => prev + session.getRed()),
                  sessions.fold<int>(0, (prev, session) => prev + session.getPurple()),
                  sessions.fold<int>(0, (prev, session) => prev + session.getPink()),
                  sessions.fold<int>(0, (prev, session) => prev + session.getGrey()),
                ),
              ),
              const SizedBox(height: 10.0),
              Center(child: Line(sessions)),
            ],
          ),
        ),
      )
    );
  }
}