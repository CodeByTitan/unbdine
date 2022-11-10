import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:unbdine/a_splash/splash_screen.dart';
import 'package:unbdine/c_dashboard/cart/cart_screen.dart';
import 'package:unbdine/utils/app_theme.dart';
import 'package:unbdine/widgets/error_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = getErrorScreen;
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.dark,
          home: child,
          routes: {
            CartScreen.routeName: (ctx) => const CartScreen(),
          },
        );
      },
      child: const SplashScreen(),
    );
  }
}
