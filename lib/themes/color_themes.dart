import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './color_palettes.dart';
import './page_transition_theme.dart';

ThemeData lightTheme() {
  return ThemeData(
    pageTransitionsTheme: pageTransitionTheme(),
    primarySwatch: LightPalette.swatchColor,
    primaryColor: LightPalette.swatchColor,
    backgroundColor: const Color.fromARGB(255, 218, 218, 218),
    primaryColorDark: LightPalette.swatchColor.shade900,
    primaryColorLight: LightPalette.swatchColor.shade50,
    scaffoldBackgroundColor: const Color.fromARGB(255, 248, 241, 217),
    highlightColor: const Color(0xFFF77E21),
    disabledColor: Colors.grey,
    errorColor: Colors.red,
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFFfeedb8),
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
    buttonTheme: const ButtonThemeData(
      height: 40,
      buttonColor: Color(0xFF00C897),
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
    brightness: Brightness.light,
    useMaterial3: true,
  );
}

ThemeData darkTheme() {
  return ThemeData(
    pageTransitionsTheme: pageTransitionTheme(),
    primarySwatch: DarkPalette.swatchColor,
    primaryColor: DarkPalette.swatchColor,
    backgroundColor: const Color.fromARGB(255, 17, 17, 26),
    primaryColorDark: DarkPalette.swatchColor.shade900,
    primaryColorLight: const Color.fromARGB(255, 44, 47, 54),
    scaffoldBackgroundColor: const Color(0xFF0b1224),
    highlightColor: const Color(0xFFF77E21),
    disabledColor: Colors.grey,
    errorColor: const Color(0xFFE43F5A),
    appBarTheme: AppBarTheme(
      backgroundColor: DarkPalette.swatchColor.shade400,
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
    buttonTheme: const ButtonThemeData(
      height: 40,
      buttonColor: Color(0xFF00C897),
    ),
    listTileTheme: const ListTileThemeData(
      enableFeedback: true,
      textColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyText1: GoogleFonts.comfortaa(
        color: Colors.white,
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
        backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      dialTextColor: Colors.white70,
      backgroundColor: Colors.grey[700],
    ),
    brightness: Brightness.dark,
    useMaterial3: true,
  );
}
