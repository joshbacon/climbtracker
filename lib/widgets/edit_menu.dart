import 'package:flutter/material.dart';
import 'package:climb_tracker/models/colors.dart';
import 'package:climb_tracker/models/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditMenu extends StatefulWidget {
  const EditMenu(this.session, {Key? key}) : super(key: key);

  final Session session;

  @override
  State<EditMenu> createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> {

  void _saveDay() async {
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
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: darkGrey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.5),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _updateDate(context);
                        },
                        icon: Icon(Icons.calendar_month_outlined, color: offWhite),
                        iconSize: 32.0,
                      ),
                      Text(
                        widget.session.getDateString(),
                        style: TextStyle(color: offWhite, fontSize: 20.0),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 7.5),
                    child: Wrap(
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
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                _saveDay();
                Navigator.pop(context);
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: lightTheme,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}