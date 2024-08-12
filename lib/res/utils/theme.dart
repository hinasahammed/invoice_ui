import 'package:flutter/material.dart';

class MyThemes {
 static ValueNotifier<bool> isDark = ValueNotifier(true);

  static final ThemeData appThemeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff0E75F4),
      primary: const Color(0xff0E75F4),
      onPrimary: Colors.white,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );

  static final ThemeData darkThemeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff0E75F4),
      primary: const Color(0xff0E75F4),
      onPrimary: Colors.white,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}
