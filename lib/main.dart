import 'package:climb_tracker/pages/list_page.dart';
import 'package:flutter/material.dart';

// TODO:
// - move all the colors into the theme (https://stackoverflow.com/questions/72089248/flutter-add-custom-color-to-existing-theme)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const ListPage(title: 'Climb Tracker'),
    );
  }
}