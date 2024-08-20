import 'package:climb_tracker/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:climb_tracker/models/session.dart';
import 'package:climb_tracker/pages/stats_page.dart';
import 'package:climb_tracker/widgets/edit_menu.dart';
import 'package:climb_tracker/widgets/list_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key, required this.title});
  final String title;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  late Future<List<Session>> _sessions;
  List<Session> _statsList = [];

  Future<List<Session>> _loadHistory() async{
    List<Session> data = [];
    final prefs = await SharedPreferences.getInstance();

    final keys = prefs.getKeys();
    for (String key in keys) {
      final session = prefs.getString(key);
      if (session != null) data.add(Session.fromString(session));
    }

    data.sort((a, b) => a.getDate().compareTo(b.getDate()));
    _statsList = data.toList();
    return data.reversed.toList();
  }

  // Created for debugging, kept for future possible functionality
  void clearStorage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void refreshList() {
    setState(() {
      _sessions = _loadHistory();
    });
  }

  @override
  void initState() {
    refreshList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset('images/logo.png', width: 45.0, height: 45.0)
            ),
            const SizedBox(width: 10.0),
            Text(widget.title),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline_outlined),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => EditMenu(Session()),
              ).then((_) {
                refreshList();
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StatsPage(_statsList)),
              );
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
                      return Divider(height: 3, color: darkTheme);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      final session = days[index];
                      return ListItem(session, refreshList);
                    },
                  );
                } else {
                  return Center(
                    child: Text(
                        'Make your first entry!\n(You can always edit entries later)',
                        style: TextStyle(
                          color: lightTheme,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
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