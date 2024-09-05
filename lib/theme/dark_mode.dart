import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      // ignore: deprecated_member_use
      background: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
      inversePrimary: Colors.grey.shade500,
      tertiary: Colors.black,
    ),
    textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Colors.grey[300],
          displayColor: Colors.white,
        ));
