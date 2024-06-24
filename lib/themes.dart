// Suggested code may be subject to a license. Learn more: ~LicenseLog:1835609121.
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
    colorScheme:  ColorScheme.dark(
    surface: Color(0xffffffff),
    primary: Color(0xff3369ff),
    secondary: Color(0xffffffff)
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors.black)
    )
);


// Suggested code may be subject to a license. Learn more: ~LicenseLog:3227376539.
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme:  ColorScheme.dark(
    surface: Color(0xFF000000),
    primary: Color(0xff3369ff),
    secondary: Color(0xffffffff)
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors.white)
    )
  );

