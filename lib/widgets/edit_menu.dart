import 'package:climb_tracker/models/session.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO:
// - need a date picker (limit dates to today and earlier)
// - update to take in existing data to edit entries

class EditMenu extends StatefulWidget {
  const EditMenu({Key? key}) : super(key: key);

  @override
  State<EditMenu> createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> {

  Session today = Session(DateTime.now().toString().split(' ')[0]);

  void saveDay() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(today.getDate(), today.toString());
    } finally {}
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color.fromARGB(255, 36, 36, 36),
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
                        onPressed: () => {saveDay()},
                        icon: const Icon(Icons.calendar_month_outlined, color: Color.fromARGB(255, 184, 184, 184)),
                        iconSize: 32.0,
                      ),
                      Text(
                        today.getDate(),
                        style: const TextStyle(color: Color.fromARGB(255, 226, 226, 226), fontSize: 20.0),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 7.5),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        SizedBox(
                          width: 105.5,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {setState(() {today.removeGreen();});},
                                icon: const Icon(
                                  Icons.remove_circle_outline_rounded,
                                  color: Color.fromARGB(255, 184, 184, 184),
                                ),
                              ),
                              SizedBox(
                                width: 57.5,
                                child: ElevatedButton(
                                  onPressed: () {setState(() {today.addGreen();});},
                                  style: ButtonStyle(
                                    foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                    backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
                                  ),
                                  child: Text(today.getGreen().toString()),
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
                                onPressed: () {setState(() {today.removeYellow();});},
                                icon: const Icon(
                                  Icons.remove_circle_outline_rounded,
                                  color: Color.fromARGB(255, 184, 184, 184),
                                ),
                              ),
                              SizedBox(
                                width: 57.5,
                                child: ElevatedButton(
                                  onPressed: () {setState(() {today.addYellow();});},
                                  style: ButtonStyle(
                                    foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                    backgroundColor: WidgetStateProperty.all<Color>(Colors.yellow),
                                  ),
                                  child: Text(today.getYellow().toString()),
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
                                onPressed: () {setState(() {today.removeOrange();});},
                                icon: const Icon(
                                  Icons.remove_circle_outline_rounded,
                                  color: Color.fromARGB(255, 184, 184, 184),
                                ),
                              ),
                              SizedBox(
                                width: 57.5,
                                child: ElevatedButton(
                                  onPressed: () {setState(() {today.addOrange();});},
                                  style: ButtonStyle(
                                    foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                    backgroundColor: WidgetStateProperty.all<Color>(Colors.orange),
                                  ),
                                  child: Text(today.getOrange().toString()),
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
                                onPressed: () {setState(() {today.removeBlue();});},
                                icon: const Icon(
                                  Icons.remove_circle_outline_rounded,
                                  color: Color.fromARGB(255, 184, 184, 184),
                                ),
                              ),
                              SizedBox(
                                width: 57.5,
                                child: ElevatedButton(
                                  onPressed: () {setState(() {today.addBlue();});},
                                  style: ButtonStyle(
                                    foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                    backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                                  ),
                                  child: Text(today.getBlue().toString()),
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
                                onPressed: () {setState(() {today.removeRed();});},
                                icon: const Icon(
                                  Icons.remove_circle_outline_rounded,
                                  color: Color.fromARGB(255, 184, 184, 184),
                                ),
                              ),
                              SizedBox(
                                width: 57.5,
                                child: ElevatedButton(
                                  onPressed: () {setState(() {today.addRed();});},
                                  style: ButtonStyle(
                                    foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                    backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                                  ),
                                  child: Text(today.getRed().toString()),
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
                                onPressed: () {setState(() {today.removePurple();});},
                                icon: const Icon(
                                  Icons.remove_circle_outline_rounded,
                                  color: Color.fromARGB(255, 184, 184, 184),
                                ),
                              ),
                              SizedBox(
                                width: 57.5,
                                child: ElevatedButton(
                                  onPressed: () {setState(() {today.addPurple();});},
                                  style: ButtonStyle(
                                    foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                    backgroundColor: WidgetStateProperty.all<Color>(Colors.purple),
                                  ),
                                  child: Text(today.getPurple().toString()),
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
                                onPressed: () {setState(() {today.removePink();});},
                                icon: const Icon(
                                  Icons.remove_circle_outline_rounded,
                                  color: Color.fromARGB(255, 184, 184, 184),
                                ),
                              ),
                              SizedBox(
                                width: 57.5,
                                child: ElevatedButton(
                                  onPressed: () {setState(() {today.addPink();});},
                                  style: ButtonStyle(
                                    foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                    backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 255, 91, 255)),
                                  ),
                                  child: Text(today.getPink().toString()),
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
                                onPressed: () {setState(() {today.removeGrey();});},
                                icon: const Icon(
                                  Icons.remove_circle_outline_rounded,
                                  color: Color.fromARGB(255, 184, 184, 184),
                                ),
                              ),
                              SizedBox(
                                width: 57.5,
                                child: ElevatedButton(
                                  onPressed: () {setState(() {today.addGrey();});},
                                  style: ButtonStyle(
                                    foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                    backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 219, 219, 219)),
                                  ),
                                  child: Text(today.getGrey().toString()),
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
                // TODO:
                // update local storage
                // include error handling popup
                Navigator.pop(context);
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  color: Color.fromARGB(255, 38, 151, 93),
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