import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Map<int, Color> red = const <int, Color>{
    50: const Color(0xFFffedee),
    100: const Color(0xFFffdbde),
    200: const Color(0xFFfec8cd),
    300: const Color(0xFFfeb6bd),
    400: const Color(0xFFfea4ac),
    500: const Color(0xFFfe929b),
    600: const Color(0xFFfe808b),
    700: const Color(0xFFfd6d7a),
    800: const Color(0xFFfd5b6a),
    900: const Color(0xFFfd4959)
  };

  static const Color background = Color(0xFF0F1923);
  static const Color mainTextColor = Color(0xFFEEEEEE);
  static const Color selectedTabColor = Color(0xFFFD4959);
  static const Color gradientStartColor = Color(0xFF6365C2);
  static const Color gradientEndColor = Color(0xFF292A4B);
  static const Color darkPurple = Color(0xFF1E2050);
  static const Color grey = Color(0xFF9192A7);
  static const Color detailListBackground = Color(0xFF14212E);
}
