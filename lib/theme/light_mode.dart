import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      // ignore: deprecated_member_use
      background: Colors.grey.shade300,
      primary: Colors.grey.shade200,
      secondary: Colors.grey.shade400,
      inversePrimary: Colors.grey.shade600,
      tertiary: Colors.white,
    ),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.grey[800],
          displayColor: Colors.black,
        ));
