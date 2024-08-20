import 'dart:async';
import 'package:climb_tracker/widgets/charts/pie_chart.dart';
import 'package:climb_tracker/widgets/charts/scatter_chart.dart';
import 'package:flutter/material.dart';
import 'package:climb_tracker/models/colors.dart';
import 'package:climb_tracker/models/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO:
// - figure out how to update the date properly
// -- right now it makes a copy of the session on the same date, either:
// --- update _saveSession to use an id or something (should probably have this anyway?)
// --- or, leave _saveSession making it's copy but then delete the original (seems silly... right?... just do option 1)

class SessionPage extends StatefulWidget {
  const SessionPage(this.session, {Key? key}) : super(key: key);

  final Session session;

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {

  bool showingSaved = false;
  Timer? setShowing;

  void save() {
    setState(() {
      showingSaved = true;
    });
    _saveSession();
    setShowing = Timer(
      const Duration(seconds: 1),
      () {
        setState(() {
          showingSaved = false;
        });
      }
    );
  }

  void _saveSession() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(widget.session.getId(), widget.session.toString());
    } finally {}
  }

  void _updateDate(BuildContext context) async {
    DateTime? selected = await showDatePicker(
      context: context,
      firstDate: DateTime(2023, 5, 9),
      lastDate: DateTime.now(),
      initialDate: widget.session.date,
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
        widget.session.setDate(selected);
      });
    }
  }

  @override
  void dispose() {
    setShowing?.cancel();
    print(widget.session.toString());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(widget.session.getDateString()),
            IconButton(
              onPressed: () {
                _updateDate(context);
              },
              icon: Icon(Icons.calendar_month_outlined, color: offWhite),
              iconSize: 32.0,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 350.0,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Pie(
                      widget.session.getGreen(),
                      widget.session.getYellow(),
                      widget.session.getOrange(),
                      widget.session.getBlue(),
                      widget.session.getRed(),
                      widget.session.getPurple(),
                      widget.session.getPink(),
                      widget.session.getGrey(),
                    ),
                  ),
                  Positioned(
                    bottom: 20.0,
                    right: 20.0,
                    child: Scatter(
                      widget.session.getGreen(),
                      widget.session.getYellow(),
                      widget.session.getOrange(),
                      widget.session.getBlue(),
                      widget.session.getRed(),
                      widget.session.getPurple(),
                      widget.session.getPink(),
                      widget.session.getGrey(),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Divider(color: lightTheme),
            Column(
              children: [
                Text(
                  'Update Session',
                  style: TextStyle(
                    color: lightTheme,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    SizedBox(
                      width: 113,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {setState(() {widget.session.removeGreen();});},
                            icon: Icon(
                              Icons.remove_circle_outline_rounded,
                              color: offWhite,
                            ),
                          ),
                          SizedBox(
                            width: 65,
                            child: ElevatedButton(
                              onPressed: () {setState(() {widget.session.addGreen();});},
                              style: ButtonStyle(
                                foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                backgroundColor: WidgetStateProperty.all<Color>(green),
                              ),
                              child: Text(widget.session.getGreen().toString()),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 113,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {setState(() {widget.session.removeYellow();});},
                            icon: Icon(
                              Icons.remove_circle_outline_rounded,
                              color: offWhite,
                            ),
                          ),
                          SizedBox(
                            width: 65,
                            child: ElevatedButton(
                              onPressed: () {setState(() {widget.session.addYellow();});},
                              style: ButtonStyle(
                                foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                backgroundColor: WidgetStateProperty.all<Color>(yellow),
                              ),
                              child: Text(widget.session.getYellow().toString()),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 113,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {setState(() {widget.session.removeOrange();});},
                            icon: Icon(
                              Icons.remove_circle_outline_rounded,
                              color: offWhite,
                            ),
                          ),
                          SizedBox(
                            width: 65,
                            child: ElevatedButton(
                              onPressed: () {setState(() {widget.session.addOrange();});},
                              style: ButtonStyle(
                                foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                backgroundColor: WidgetStateProperty.all<Color>(orange),
                              ),
                              child: Text(widget.session.getOrange().toString()),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 113,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {setState(() {widget.session.removeBlue();});},
                            icon: Icon(
                              Icons.remove_circle_outline_rounded,
                              color: offWhite,
                            ),
                          ),
                          SizedBox(
                            width: 65,
                            child: ElevatedButton(
                              onPressed: () {setState(() {widget.session.addBlue();});},
                              style: ButtonStyle(
                                foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                backgroundColor: WidgetStateProperty.all<Color>(blue),
                              ),
                              child: Text(widget.session.getBlue().toString()),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 113,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {setState(() {widget.session.removeRed();});},
                            icon: Icon(
                              Icons.remove_circle_outline_rounded,
                              color: offWhite,
                            ),
                          ),
                          SizedBox(
                            width: 65,
                            child: ElevatedButton(
                              onPressed: () {setState(() {widget.session.addRed();});},
                              style: ButtonStyle(
                                foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                backgroundColor: WidgetStateProperty.all<Color>(red),
                              ),
                              child: Text(widget.session.getRed().toString()),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 113,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {setState(() {widget.session.removePurple();});},
                            icon: Icon(
                              Icons.remove_circle_outline_rounded,
                              color: offWhite,
                            ),
                          ),
                          SizedBox(
                            width: 65,
                            child: ElevatedButton(
                              onPressed: () {setState(() {widget.session.addPurple();});},
                              style: ButtonStyle(
                                foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                backgroundColor: WidgetStateProperty.all<Color>(purple),
                              ),
                              child: Text(widget.session.getPurple().toString()),
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 113,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {setState(() {widget.session.removePink();});},
                            icon: Icon(
                              Icons.remove_circle_outline_rounded,
                              color: offWhite,
                            ),
                          ),
                          SizedBox(
                            width: 65,
                            child: ElevatedButton(
                              onPressed: () {setState(() {widget.session.addPink();});},
                              style: ButtonStyle(
                                foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                backgroundColor: WidgetStateProperty.all<Color>(pink),
                              ),
                              child: Text(widget.session.getPink().toString()),
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 113,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {setState(() {widget.session.removeGrey();});},
                            icon: Icon(
                              Icons.remove_circle_outline_rounded,
                              color: offWhite,
                            ),
                          ),
                          SizedBox(
                            width: 65,
                            child: ElevatedButton(
                              onPressed: () {setState(() {widget.session.addGrey();});},
                              style: ButtonStyle(
                                foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                backgroundColor: WidgetStateProperty.all<Color>(grey),
                              ),
                              child: Text(widget.session.getGrey().toString()),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    AnimatedPositioned(
                      top: 5.0,
                      left: showingSaved ? -45.0 : 5.0,
                      curve: Curves.easeOutBack,
                      duration: const Duration(seconds: 1),
                      child: Icon(Icons.check_circle_outline_rounded, color: lightTheme, size: 36.0,)
                    ),
                    OutlinedButton.icon(
                      icon: const Icon(Icons.save_rounded),
                      label: const Text('Save'),
                      onPressed: save,
                    ),
                  ],
                ),
              ]
            )
          ],
        ),
      )
    );
  }
}