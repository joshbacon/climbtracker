import 'package:climb_tracker/models/colors.dart';
import 'package:climb_tracker/pages/list_page.dart';
import 'package:flutter/material.dart';

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
        primaryColor: lightTheme,
        scaffoldBackgroundColor: darkGrey,
        dividerColor: darkTheme,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: darkTheme,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll<Color>(lightTheme),
            iconColor:  WidgetStatePropertyAll<Color>(lightTheme),
            overlayColor: WidgetStatePropertyAll<Color>(lightTheme.withAlpha(100)),
            side: WidgetStatePropertyAll<BorderSide>(BorderSide(color: lightTheme)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
            padding: const WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(vertical: 2.0, horizontal: 50.0)),
          )
        ),
        cardTheme: CardTheme(
          color: lightGrey,
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: lightTheme)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: lightTheme)),
          outlineBorder: BorderSide(color: lightTheme),
          fillColor: offWhite,
          filled: true,
          labelStyle: TextStyle(color: darkGrey),
          hintStyle: TextStyle(color: darkGrey),
        ),
        dialogTheme: const DialogTheme(),
        datePickerTheme: DatePickerThemeData(
          headerForegroundColor: offWhite,
          headerBackgroundColor: lightTheme,
          backgroundColor: darkGrey,
          dividerColor: lightTheme,
          todayForegroundColor: WidgetStatePropertyAll<Color>(offWhite),
        ),
      ),
      home: const ListPage(title: 'Climb Tracker'),
    );
  }
}