import 'package:climb_tracker/models/colors.dart';
import 'package:climb_tracker/models/grades.dart';
import 'package:climb_tracker/widgets/grade_legend.dart';
import 'package:flutter/material.dart';
import 'package:climb_tracker/models/session.dart';
import 'package:climb_tracker/widgets/charts/pie_chart_legend.dart';
import 'package:climb_tracker/widgets/charts/line_chart.dart';

class StatsPage extends StatefulWidget {
  const StatsPage(this.sessions, {Key? key}) : super(key: key);

  final List<Session> sessions;

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  
  bool _showFilters = false;

  final List<bool> _colorSelections1 = [true, true, true, true];
  final List<bool> _colorSelections2 = [true, true, true, true];

  late DateTime startDate;
  late DateTime endDate;
  late List<Session> filteredSessions;

  void _updateDate(BuildContext context, bool isStartDate) async {
    DateTime? selected = await showDatePicker(
      context: context,
      firstDate: isStartDate ? widget.sessions.first.getDate() : startDate,
      lastDate: isStartDate ? endDate : DateTime.now(),
      initialDate: isStartDate ? startDate : endDate,
      helpText: '',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      builder:(context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: darkTheme,
              onSurface: lightTheme,
            ),
          ),
          child: child!,
        );
      },
    );
    if (selected != null) {
      setState(() {
        if (isStartDate){
          startDate = selected;
        } else {
          endDate = selected;
        }
        DateTime sDate = DateTime(startDate.year, startDate.month, startDate.day);
        DateTime eDate = DateTime(endDate.year, endDate.month, endDate.day);
        filteredSessions = widget.sessions.where((session) {
          DateTime date = session.getDate();
          date = DateTime(date.year, date.month, date.day);
          return date.compareTo(sDate) >= 0 && date.compareTo(eDate) <= 0;
        }).toList();
      });
    }
  }

  @override
  void initState() {
    if (widget.sessions.isNotEmpty) {
      startDate = widget.sessions.first.getDate();
      endDate = widget.sessions.last.getDate();
      filteredSessions = widget.sessions.where((session) {
        return session.getDate().compareTo(startDate) >= 0 && session.getDate().compareTo(endDate) <= 0;
      }).toList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stats"),
        actions: [
          IconButton(
            icon: const Icon(Icons.legend_toggle_outlined),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => const GradeLegend(),
              );
            },
          )
        ]
      ),
      body: widget.sessions.isNotEmpty ? SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _showFilters = !_showFilters;
                    });
                  },
                  child: Text(
                    'Filters',
                    style: TextStyle(
                      color: offWhite,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 250),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: _showFilters ? 180.0 : 0,
                    child: Column(
                      children: [
                        const SizedBox(height: 15.0),
                        ToggleButtons(
                          direction: Axis.horizontal,
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                          selectedBorderColor: lightTheme,
                          borderColor: lightTheme,
                          fillColor: lightGrey,
                          isSelected: _colorSelections1,
                          onPressed: (int index) {
                            setState(() {
                              _colorSelections1[index] = !_colorSelections1[index];
                            });
                          },
                          children: [
                            Icon(Icons.square_rounded, color: green),
                            Icon(Icons.square_rounded, color: yellow),
                            Icon(Icons.square_rounded, color: orange),
                            Icon(Icons.square_rounded, color: blue),
                          ],
                        ),
                        ToggleButtons(
                          direction: Axis.horizontal,
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
                          selectedBorderColor: lightTheme,
                          borderColor: lightTheme,
                          fillColor: lightGrey,
                          isSelected: _colorSelections2,
                          onPressed: (int index) {
                            setState(() {
                              _colorSelections2[index] = !_colorSelections2[index];
                            });
                          },
                          children: [
                            Icon(Icons.square_rounded, color: red),
                            Icon(Icons.square_rounded, color: purple),
                            Icon(Icons.square_rounded, color: pink),
                            Icon(Icons.square_rounded, color: grey),
                          ],
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _updateDate(context, true);
                              },
                              child: Text(
                                '${startDate.year}-${startDate.month}-${startDate.day}',
                                style: TextStyle(color: offWhite, fontSize: 20.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: offWhite,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _updateDate(context, false);
                              },
                              child: Text(
                                '${endDate.year}-${endDate.month}-${endDate.day}',
                                style: TextStyle(color: offWhite, fontSize: 20.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ]
                    ),
                  ),
                ),
                Divider(color: lightTheme),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Avg. Grade',
                      style: TextStyle(
                        color: offWhite,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Text(
                      getTotalAverage(filteredSessions),
                      style: TextStyle(
                        color: offWhite,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (
                        filteredSessions.fold<int>(0, (prev, session) => prev + session.getGreen()) +
                        filteredSessions.fold<int>(0, (prev, session) => prev + session.getYellow()) +
                        filteredSessions.fold<int>(0, (prev, session) => prev + session.getOrange()) +
                        filteredSessions.fold<int>(0, (prev, session) => prev + session.getBlue()) +
                        filteredSessions.fold<int>(0, (prev, session) => prev + session.getRed()) +
                        filteredSessions.fold<int>(0, (prev, session) => prev + session.getPurple()) +
                        filteredSessions.fold<int>(0, (prev, session) => prev + session.getPink()) +
                        filteredSessions.fold<int>(0, (prev, session) => prev + session.getGrey())
                      ).toString(),
                      style: TextStyle(
                        color: offWhite,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Text(
                      'Total Routes',
                      style: TextStyle(
                        color: offWhite,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Center(
                  child: PieLegend(
                    _colorSelections1[0] ? filteredSessions.fold<int>(0, (prev, session) => prev + session.getGreen()) : 0,
                    _colorSelections1[1] ? filteredSessions.fold<int>(0, (prev, session) => prev + session.getYellow()) : 0,
                    _colorSelections1[2] ? filteredSessions.fold<int>(0, (prev, session) => prev + session.getOrange()) : 0,
                    _colorSelections1[3] ? filteredSessions.fold<int>(0, (prev, session) => prev + session.getBlue()) : 0,
                    _colorSelections2[0] ? filteredSessions.fold<int>(0, (prev, session) => prev + session.getRed()) : 0,
                    _colorSelections2[1] ? filteredSessions.fold<int>(0, (prev, session) => prev + session.getPurple()) : 0,
                    _colorSelections2[2] ? filteredSessions.fold<int>(0, (prev, session) => prev + session.getPink()) : 0,
                    _colorSelections2[3] ? filteredSessions.fold<int>(0, (prev, session) => prev + session.getGrey()) : 0,
                  ),
                ),
                const SizedBox(height: 30.0),
                Line(
                  filteredSessions,
                  [_colorSelections1, _colorSelections2].expand((val) => val).toList()
                ),
                const SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ) : Center(
        child: Text(
            'No data to display',
            style: TextStyle(
              color: lightTheme,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
        ),
      )
    );
  }
}

