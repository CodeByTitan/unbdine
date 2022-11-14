import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

Widget getErrorScreen(FlutterErrorDetails error) {
  return const ErrorScreen();
}

class ErrorScreen extends HookWidget {
  const ErrorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                child: SizedBox(
                  width: 0.6,
                  height: 35,
                  child: ElevatedButton(
                    child: const Text('Try Again'),
                    onPressed: () {
                      Phoenix.rebirth(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
