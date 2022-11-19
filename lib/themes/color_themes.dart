import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './color_palettes.dart';
import './page_transition_theme.dart';

ThemeData lightTheme() {
  return ThemeData(
    pageTransitionsTheme: pageTransitionTheme(),
    primarySwatch: LightPalette.swatchColor,
    primaryColor: LightPalette.swatchColor,
    backgroundColor: LightPalette.swatchColor.shade100,
    primaryColorDark: LightPalette.swatchColor.shade900,
    primaryColorLight: LightPalette.swatchColor.shade50,
    scaffoldBackgroundColor: const Color(0xFFfef4d4),
    highlightColor: Colors.orange,
    disabledColor: Colors.grey,
    errorColor: Colors.red,
    appBarTheme: AppBarTheme(
      backgroundColor: LightPalette.swatchColor.shade600,
      foregroundColor: Colors.black,
      elevation: 2,
      titleTextStyle: GoogleFonts.cabin(
        color: Colors.black,
        letterSpacing: 1.5,
        wordSpacing: 1.2,
        fontSize: 20,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      width: 275,
      elevation: 2,
    ),
    listTileTheme: const ListTileThemeData(
      enableFeedback: true,
      textColor: Colors.black,
    ),
    textTheme: TextTheme(
      bodyText1: GoogleFonts.comfortaa(
        color: Colors.black,
      ),
      bodyText2: GoogleFonts.comfortaa(
        color: Colors.white,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    primaryIconTheme: const IconThemeData(
      color: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
    ),
    timePickerTheme: const TimePickerThemeData(
      dialTextColor: Colors.black,
      backgroundColor: Colors.white,
      hourMinuteTextColor: Colors.black,
    ),
    brightness: Brightness.light,
    useMaterial3: true,
  );
}

ThemeData darkTheme() {
  return ThemeData(
    pageTransitionsTheme: pageTransitionTheme(),
    primarySwatch: DarkPalette.swatchColor,
    primaryColor: DarkPalette.swatchColor,
    backgroundColor: DarkPalette.swatchColor.shade800,
    primaryColorDark: DarkPalette.swatchColor.shade900,
    primaryColorLight: DarkPalette.swatchColor.shade100,
    scaffoldBackgroundColor: const Color(0xFF04070e),
    highlightColor: Colors.orange,
    disabledColor: Colors.grey,
    errorColor: Colors.red,
    appBarTheme: AppBarTheme(
      backgroundColor: DarkPalette.swatchColor.shade600,
      foregroundColor: Colors.white,
      elevation: 2,
      titleTextStyle: GoogleFonts.cabin(
        color: Colors.white,
        letterSpacing: 1.5,
        wordSpacing: 1.2,
        fontSize: 20,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      width: 275,
      elevation: 2,
    ),
    listTileTheme: const ListTileThemeData(
      enableFeedback: true,
      textColor: Color(0xFFe8e9ed),
    ),
    textTheme: TextTheme(
      bodyText1: GoogleFonts.comfortaa(
        color: const Color(0xFFe8e9ed),
      ),
      bodyText2: GoogleFonts.comfortaa(
        color: const Color(0xFFe8e9ed),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFFe8e9ed),
    ),
    primaryIconTheme: const IconThemeData(
      color: Color(0xFFe8e9ed),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
        foregroundColor: MaterialStateProperty.all(const Color(0xFFe8e9ed)),
      ),
    ),
    timePickerTheme: const TimePickerThemeData(
      dialTextColor: Color(0xFFe8e9ed),
      backgroundColor: Colors.blueGrey,
      hourMinuteTextColor: Colors.white,
    ),
    brightness: Brightness.dark,
    useMaterial3: true,
  );
}
