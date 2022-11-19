import 'package:flutter/material.dart';

import 'auth/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  Future<void> checkUserStatus() async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        // user != null

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const AuthenticationScreen(),
          ),
        );
        // : Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(
        //       builder: (context) => AuthenticationScreen(
        //         fireRef: widget.fireRef,
        //       ),
        //     ),
        //   );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColorLight,
          ),
          Center(
            child: Text(
              'UNB Dine',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
