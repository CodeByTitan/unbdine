import 'package:flutter/material.dart';

PageTransitionsTheme pageTransitionTheme() {
  return const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: OpenUpwardsPageTransitionsBuilder(),
    },
  );
}
