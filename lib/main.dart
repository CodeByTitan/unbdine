import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'screens/splash_screen.dart';
import './screens/cart/cart_screen.dart';
import './screens/payment/payment_screen.dart';
import './themes/color_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(
    Phoenix(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: lightTheme(),
      darkTheme: darkTheme(),
      routes: {
        CartScreen.routeName: (ctx) => const CartScreen(),
        PaymentScreen.routeName: (ctx) => const PaymentScreen(),
      },
    );
  }
}
