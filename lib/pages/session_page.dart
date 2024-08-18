import 'package:climb_tracker/widgets/charts/pie_chart.dart';
import 'package:climb_tracker/widgets/charts/radar_chart.dart';
import 'package:flutter/material.dart';
import 'package:climb_tracker/models/colors.dart';
import 'package:climb_tracker/models/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionPage extends StatefulWidget {
  const SessionPage(this.session, {Key? key}) : super(key: key);

  final Session session;

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {

  void _saveDay() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(widget.session.getDate().toString(), widget.session.toString());
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(widget.session.getDateString()),
            // IconButton(
            //   onPressed: () {
            //     _updateDate(context);
            //   },
            //   icon: Icon(Icons.calendar_month_outlined, color: offWhite),
            //   iconSize: 32.0,
            // ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            const SizedBox(
              width: double.maxFinite,
              height: 300.0,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Pie(),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Radar(),
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
                      width: 105.5,
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
                            width: 57.5,
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
                      width: 105.5,
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
                            width: 57.5,
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
                      width: 105.5,
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
                            width: 57.5,
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
                      width: 105.5,
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
                            width: 57.5,
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
                      width: 105.5,
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
                            width: 57.5,
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
                      width: 105.5,
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
                            width: 57.5,
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
                      width: 105.5,
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
                            width: 57.5,
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
                      width: 105.5,
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
                            width: 57.5,
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
                OutlinedButton.icon(
                  icon: const Icon(Icons.save_rounded),
                  label: const Text('Save'),
                  onPressed: () { _saveDay(); },
                )
              ]
            )
          ],
        ),
      )
    );
  }
}