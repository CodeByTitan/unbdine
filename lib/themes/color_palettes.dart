import 'package:flutter/material.dart';

class LightPalette {
  static const MaterialColor swatchColor = MaterialColor(
    0xFFfcc827,
    <int, Color>{
      50: Color(0xFFfee493),
      100: Color(0xFFfdde7d),
      200: Color(0xFFfdd968),
      300: Color(0xFFfdd352),
      400: Color(0xFFfcce3d),
      500: Color(0xFFfcc827),
      600: Color(0xFFe3b423),
      700: Color(0xFFcaa01f),
      800: Color(0xFFb08c1b),
      900: Color(0xFF977817),
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
