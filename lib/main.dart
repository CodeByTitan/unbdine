import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/auth/auth_screen.dart';
import './themes/color_themes.dart';
import './screens/home/home.dart';
import './screens/university_selector/unv_home_screen.dart';
import './screens/cart/cart_screen.dart';
import './screens/payment/payment_screen.dart';

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
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UnSelScreen(),
      theme: lightTheme(),
      darkTheme: darkTheme(),
      routes: {
        AuthenticationScreen.routeName: (ctx) => const AuthenticationScreen(),
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        CartScreen.routeName: (ctx) => const CartScreen(),
        PaymentScreen.routeName: (ctx) => const PaymentScreen(),
      },
    );
  }
}
