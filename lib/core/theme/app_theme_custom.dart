import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AppThemeCustom {
  AppThemeCustom._();

  static const primaryColor = Color(0xFF00A8FF);
  static const secondaryColor = Color(0xFF00A8FF);
  static const darkColor = Color(0xFF00A8FF);
  static const bodyTextColor = Color(0xFF00A8FF);
  static const bgColor = Color(0xFF00A8FF);

  static final lightTheme = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.light,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: Colors.black,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(elevation: 0),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: GoogleFonts.poppinsTextTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(elevation: 0),
  );
}
