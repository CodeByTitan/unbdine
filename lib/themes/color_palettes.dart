import 'package:flutter/material.dart';

class LightPalette {
  static const MaterialColor swatchColor = MaterialColor(
    0xFFfac213,
    <int, Color>{
      50: Color(0xFFfde189),
      100: Color(0xFFfcda71),
      200: Color(0xFFfcd45a),
      300: Color(0xFFfbce42),
      400: Color(0xFFfbc82b),
      500: Color(0xFFfac213),
      600: Color(0xFFe1af11),
      700: Color(0xFFc89b0f),
      800: Color(0xFFaf880d),
      900: Color(0xFF96740b),
    },
  );
}

class DarkPalette {
  static const MaterialColor swatchColor = MaterialColor(
    0xFF162447,
    <int, Color>{
      50: Color(0xFF8b92a3),
      100: Color(0xFF737c91),
      200: Color(0xFF5c667e),
      300: Color(0xFF45506c),
      400: Color(0xFF2d3a59),
      500: Color(0xFF162447), // 0
      600: Color(0xFF142040),
      700: Color(0xFF121d39),
      800: Color(0xFF0f1932),
      900: Color(0xFF0d162b),
    },
  );
}
