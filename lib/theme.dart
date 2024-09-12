import 'package:flutter/material.dart';

final theme = ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 5,
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.deepPurple),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
      ),
    ));
