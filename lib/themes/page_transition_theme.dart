import 'package:flutter/material.dart';
import 'package:unbdine/helpers/custom_route.dart';

PageTransitionsTheme pageTransitionTheme() {
  return PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CustomPageTransitionBuilder(),
    },
  );
}
