import 'dart:convert';
import 'package:climb_tracker/stats.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO:
// - modularize some widgets dude (just setup the whole project properly)
// - move all the colors into the theme (https://stackoverflow.com/questions/72089248/flutter-add-custom-color-to-existing-theme)
// - make it possible to edit existing entries
// - like the whole stats page
// - need a date picker on the edit dialog (limit dates to today and earlier)


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Climb Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color.fromARGB(255, 36, 36, 36),
        dividerColor: Colors.purple,
        cardTheme: const CardTheme(
          color: Color.fromARGB(255, 56, 56, 56),
          shadowColor: Colors.purple,
        ),
      ),
      home: const MyHomePage(title: 'Climb Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Day today = Day(DateTime.now().toString().split(' ')[0]);
  late Future<List<Day>> _days;

  void saveDay() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(today.getDate(), today.toString());
    } finally {}
  }

  void _checkCurrent() async{
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString(today.getDate());
      if (data != null) {
        setState(() {
          today = Day.fromString(today.getDate(), data);
        });
      }
    } finally {}
  }

  Future<List<Day>> _loadHistory() async{
    List<Day> data = [];
    final prefs = await SharedPreferences.getInstance();

    final keys = prefs.getKeys();
    for (String key in keys) {
      final day = prefs.getString(key);
      if (day != null && key != today.getDate()) data.add(Day.fromString(key, day));
    }

    data.sort((a, b) => DateTime.parse(a.getDate()).compareTo(DateTime.parse(b.getDate())));
    return data.reversed.toList();
  }

  void _temp() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final dates = [
        "2022-07-13","2022-07-15","2022-07-17","2022-07-20","2022-07-22","2022-07-25","2022-07-29","2022-07-31",
        "2022-08-03","2022-08-08","2022-08-10","2022-08-15","2022-08-17","2022-08-19","2022-08-22","2022-08-24","2022-08-26","2022-08-28","2022-08-30","2022-08-31",
        "2023-05-02","2023-05-04","2023-05-08",
        ];
      final nums = [
        jsonEncode({"green": 0, "yellow": 1, "orange": 2, "blue": 4, "red": 3, "purple": 0, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 1, "orange": 6, "blue": 5, "red": 4, "purple": 0, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 1, "orange": 3, "blue": 5, "red": 4, "purple": 0, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 0, "orange": 3, "blue": 3, "red": 7, "purple": 1, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 2, "orange": 4, "blue": 4, "red": 4, "purple": 0, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 1, "orange": 4, "blue": 9, "red": 4, "purple": 0, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 1, "orange": 4, "blue": 7, "red": 4, "purple": 0, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 1, "orange": 2, "blue": 6, "red": 5, "purple": 0, "pink": 0, "grey": 0}),

        jsonEncode({"green": 0, "yellow": 1, "orange": 7, "blue": 7, "red": 5, "purple": 0, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 1, "orange": 2, "blue": 7, "red": 4, "purple": 0, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 3, "orange": 4, "blue": 8, "red": 5, "purple": 0, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 2, "orange": 3, "blue": 7, "red": 5, "purple": 0, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 1, "orange": 3, "blue": 7, "red": 4, "purple": 2, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 1, "orange": 2, "blue": 6, "red": 3, "purple": 0, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 1, "orange": 2, "blue": 5, "red": 3, "purple": 1, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 1, "orange": 3, "blue": 6, "red": 2, "purple": 0, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 2, "orange": 3, "blue": 2, "red": 0, "purple": 1, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 1, "orange": 1, "blue": 1, "red": 1, "purple": 1, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 2, "orange": 2, "blue": 5, "red": 2, "purple": 0, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 3, "orange": 0, "blue": 4, "red": 4, "purple": 0, "pink": 0, "grey": 0}),
        
        jsonEncode({"green": 0, "yellow": 4, "orange": 6, "blue": 0, "red": 0, "purple": 0, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 4, "orange": 7, "blue": 2, "red": 0, "purple": 0, "pink": 0, "grey": 0}),
        jsonEncode({"green": 0, "yellow": 5, "orange": 3, "blue": 3, "red": 0, "purple": 0, "pink": 0, "grey": 0}),
      ];
      for (int i=0; i <dates.length; i++) {
        prefs.setString(dates[i], nums[i]);
      }
      // _days = _loadHistory(); 
    } finally {}
  }

  @override
  void initState() {
    super.initState();
    _temp();
    // _temptemp();
    _days = _loadHistory();
    _checkCurrent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline_outlined),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog(
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
                                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                                            ),
                                            child: Text(today.getGreen()),
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
                                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                              backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                                            ),
                                            child: Text(today.getYellow()),
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
                                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                              backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                                            ),
                                            child: Text(today.getOrange()),
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
                                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                            ),
                                            child: Text(today.getBlue()),
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
                                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                            ),
                                            child: Text(today.getRed()),
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
                                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                              backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                                            ),
                                            child: Text(today.getPurple()),
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
                                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                              backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 91, 255)),
                                            ),
                                            child: Text(today.getPink()),
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
                                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                              backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 219, 219, 219)),
                                            ),
                                            child: Text(today.getGrey()),
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
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart_rounded),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Stats())
              )
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: _days,
              builder: (context, snapshot) {
                List<Day> days = snapshot.data ?? [];
                if (snapshot.hasData && days.isNotEmpty) {
                  return ListView.separated(
                    itemCount: days.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(height: 3, color: Colors.purple);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      final day = days[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 115.0,
                                child: Text(
                                  day.getDate(),
                                  style: const TextStyle(color: Color.fromARGB(255, 226, 226, 226), fontSize: 20.0),
                                ),
                              ),
                              const SizedBox( height: 5.0 ),
                              // Wrap(
                              //   alignment: WrapAlignment.spaceEvenly,
                              //   children: [
                              //     SizedBox(
                              //       width: 75.0,
                              //       child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //         children: [
                              //           const Icon(Icons.circle, color: Colors.green,),
                              //           Text(
                              //             "x ${day.getGreen()}",
                              //             style: const TextStyle(color: Color.fromARGB(255, 226, 226, 226), fontSize: 20.0),
                              //           ),
                              //         ],
                              //       )
                              //     ),
                              //     SizedBox(
                              //       width: 75.0,
                              //       child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //         children: [      
                              //           const Icon(Icons.circle, color: Colors.yellow,),
                              //           Text(
                              //             "x ${day.getYellow()}",
                              //             style: const TextStyle(color: Color.fromARGB(255, 226, 226, 226), fontSize: 20.0),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: 75.0,
                              //       child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //         children: [      
                              //           const Icon(Icons.circle, color: Colors.orange,),
                              //           Text(
                              //             "x ${day.getOrange()}",
                              //             style: const TextStyle(color: Color.fromARGB(255, 226, 226, 226), fontSize: 20.0),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: 75.0,
                              //       child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //         children: [      
                              //           const Icon(Icons.circle, color: Colors.blue,),
                              //           Text(
                              //             "x ${day.getBlue()}",
                              //             style: const TextStyle(color: Color.fromARGB(255, 226, 226, 226), fontSize: 20.0),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: 75.0,
                              //       child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //         children: [      
                              //           const Icon(Icons.circle, color: Colors.red,),
                              //           Text(
                              //             "x ${day.getRed()}",
                              //             style: const TextStyle(color: Color.fromARGB(255, 226, 226, 226), fontSize: 20.0),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: 75.0,
                              //       child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //         children: [      
                              //           const Icon(Icons.circle, color: Colors.purple,),
                              //           Text(
                              //             "x ${day.getPurple()}",
                              //             style: const TextStyle(color: Color.fromARGB(255, 226, 226, 226), fontSize: 20.0),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: 75.0,
                              //       child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //         children: [      
                              //           const Icon(Icons.circle, color: Color.fromARGB(255, 255, 91, 255),),
                              //           Text(
                              //             "x ${day.getPink()}",
                              //             style: const TextStyle(color: Color.fromARGB(255, 226, 226, 226), fontSize: 20.0),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: 75.0,
                              //       child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //         children: [      
                              //           const Icon(Icons.circle, color: Color.fromARGB(255, 219, 219, 219),),
                              //           Text(
                              //             "x ${day.getGrey()}",
                              //             style: const TextStyle(color: Color.fromARGB(255, 226, 226, 226), fontSize: 20.0),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              Wrap(
                                children: [
                                  Wrap(
                                    children: List.generate(int.parse(day.getGreen()), (index) => const Icon(
                                      Icons.square,
                                      size: 24.0,
                                      color: Colors.green,
                                    )),
                                  ),
                                  Wrap(
                                    children: List.generate(int.parse(day.getYellow()), (index) => const Icon(
                                      Icons.square,
                                      size: 24.0,
                                      color: Colors.yellow,
                                    )),
                                  ),
                                  Wrap(
                                    children: List.generate(int.parse(day.getOrange()), (index) => const Icon(
                                      Icons.square,
                                      size: 24.0,
                                      color: Colors.orange,
                                    )),
                                  ),
                                  Wrap(
                                    children: List.generate(int.parse(day.getBlue()), (index) => const Icon(
                                      Icons.square,
                                      size: 24.0,
                                      color: Colors.blue,
                                    )),
                                  ),
                                  Wrap(
                                    children: List.generate(int.parse(day.getRed()), (index) => const Icon(
                                      Icons.square,
                                      size: 24.0,
                                      color: Colors.red,
                                    )),
                                  ),
                                  Wrap(
                                    children: List.generate(int.parse(day.getPurple()), (index) => const Icon(
                                      Icons.square,
                                      size: 24.0,
                                      color: Colors.purple,
                                    )),
                                  ),
                                  Wrap(
                                    children: List.generate(int.parse(day.getPink()), (index) => const Icon(
                                      Icons.square,
                                      size: 24.0,
                                      color: Colors.pink,
                                    )),
                                  ),
                                  Wrap(
                                    children: List.generate(int.parse(day.getGrey()), (index) => const Icon(
                                      Icons.square,
                                      size: 24.0,
                                      color: Colors.grey,
                                    )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text(
                        'Make your first entry!',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}


class Day {
  String date = "05-09-2023";
  int green = 0;
  int yellow = 0;
  int orange = 0;
  int blue = 0;
  int red = 0;
  int purple = 0;
  int pink = 0;
  int grey = 0;

  Day(this.date);

  Day.fromString(String key, String day) {
    date = key;
    var tokens = jsonDecode(day);
    green = tokens['green'] ?? 0;
    yellow = tokens['yellow'] ?? 0;
    orange = tokens['orange'] ?? 0;
    blue = tokens['blue'] ?? 0;
    red = tokens['red'] ?? 0;
    purple = tokens['purple'] ?? 0;
    pink = tokens['pink'] ?? 0;
    grey = tokens['grey'] ?? 0;
  }

  @override
  String toString() {
    return jsonEncode({
      'green': green,
      'yellow': yellow,
      'orange': orange,
      'blue': blue,
      'red': red,
      'purple': purple,
      'pink': pink,
      'grey': grey
    });
  }

  String getDate() {
    return date;
  }

  String getGreen() { return green.toString(); }
  void addGreen() { green += 1; }
  void removeGreen() { if (green > 0) yellow -= 1; }

  String getYellow() { return yellow.toString(); }
  void addYellow() { yellow += 1; }
  void removeYellow() { if (yellow > 0) yellow -= 1; }

  String getOrange() { return orange.toString(); }
  void addOrange() { orange += 1; }
  void removeOrange() { if (orange > 0) orange -= 1; }

  String getBlue() { return blue.toString(); }
  void addBlue() { blue += 1; }
  void removeBlue() { if (blue > 0) blue -= 1; }
  
  String getRed() { return red.toString(); }
  void addRed() { red += 1; }
  void removeRed() { if (red > 0) red -= 1; }
  
  String getPurple() { return purple.toString(); }
  void addPurple() { purple += 1; }
  void removePurple() { if (purple > 0) purple -= 1; }
  
  String getPink() { return pink.toString(); }
  void addPink() { pink += 1; }
  void removePink() { if (pink > 0) purple -= 1; }
  
  String getGrey() { return grey.toString(); }
  void addGrey() { grey += 1; }
  void removeGrey() { if (grey > 0) purple -= 1; }
}