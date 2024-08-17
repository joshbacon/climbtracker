import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:climb_tracker/models/session.dart';
import 'package:climb_tracker/pages/stats_page.dart';
import 'package:climb_tracker/widgets/edit_menu.dart';
import 'package:climb_tracker/widgets/list_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO:
// - finish modularizing components
// -- once the temp functions are gone, make sure the rest are where they should be
// - make it possible to edit existing entries

class ListPage extends StatefulWidget {
  const ListPage({super.key, required this.title});
  final String title;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  Session today = Session(DateTime.now().toString().split(' ')[0]);
  late Future<List<Session>> _sessions;

  void _checkCurrent() async{
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString(today.getDate());
      if (data != null) {
        setState(() {
          today = Session.fromString(today.getDate(), data);
        });
      }
    } finally {}
  }

  Future<List<Session>> _loadHistory() async{
    List<Session> data = [];
    final prefs = await SharedPreferences.getInstance();

    final keys = prefs.getKeys();
    for (String key in keys) {
      final day = prefs.getString(key);
      if (day != null && key != today.getDate()) data.add(Session.fromString(key, day));
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
    _sessions = _loadHistory();
    _checkCurrent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 11, 100, 54),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline_outlined),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => const EditMenu(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart_rounded),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StatsPage())
              )
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: _sessions,
              builder: (context, snapshot) {
                List<Session> days = snapshot.data ?? [];
                if (snapshot.hasData && days.isNotEmpty) {
                  return ListView.separated(
                    itemCount: days.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(height: 3, color: Color.fromARGB(255, 11, 100, 54));
                    },
                    itemBuilder: (BuildContext context, int index) {
                      final session = days[index];
                      return ListItem(session);
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