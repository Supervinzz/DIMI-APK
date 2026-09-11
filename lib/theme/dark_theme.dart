import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFF171311),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFE67E22),
    brightness: Brightness.dark,
  ),
);
