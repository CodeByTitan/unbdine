import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unbdine/themes/color_palettes.dart';
import 'package:unbdine/themes/page_transition_theme.dart';

ThemeData lightTheme() {
  return ThemeData(
    pageTransitionsTheme: pageTransitionTheme(),
    primarySwatch: LightPalette.swatchColor,
    primaryColor: LightPalette.swatchColor,
    backgroundColor: const Color(0xFFFEF9A7),
    primaryColorDark: LightPalette.swatchColor.shade900,
    primaryColorLight: LightPalette.swatchColor.shade50,
    scaffoldBackgroundColor: const Color(0xFFfef3d0),
    highlightColor: const Color(0xFFF77E21),
    disabledColor: Colors.grey,
    errorColor: Colors.red,
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFFfeedb8),
      foregroundColor: Colors.black,
      elevation: 2,
      shadowColor: LightPalette.swatchColor.shade600,
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
      tileColor: Color(0xFFFDFFA9),
      iconColor: Color(0xFF019267),
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
    brightness: Brightness.light,
    useMaterial3: true,
  );
}

ThemeData darkTheme() {
  return ThemeData(
    pageTransitionsTheme: pageTransitionTheme(),
    primarySwatch: DarkPalette.swatchColor,
    primaryColor: DarkPalette.swatchColor,
    backgroundColor: const Color(0xFF1B1B2F),
    primaryColorDark: DarkPalette.swatchColor.shade900,
    primaryColorLight: DarkPalette.swatchColor.shade50,
    scaffoldBackgroundColor: const Color(0xFF0b1224),
    highlightColor: const Color(0xFFF77E21),
    disabledColor: Colors.grey,
    errorColor: const Color(0xFFE43F5A),
    appBarTheme: AppBarTheme(
      backgroundColor: DarkPalette.swatchColor.shade400,
      foregroundColor: Colors.white,
      elevation: 2,
      shadowColor: DarkPalette.swatchColor.shade600,
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
      tileColor: Color(0xFF1B1B2F),
      iconColor: Color(0xFF019267),
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
    brightness: Brightness.dark,
    useMaterial3: true,
  );
}
