import 'package:flutter/material.dart';
import '../helpers/custom_route.dart';

PageTransitionsTheme pageTransitionTheme() {
  return PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CustomPageTransitionBuilder(),
    },
  );
}
