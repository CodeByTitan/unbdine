import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_constant.dart';
import './custom_button.dart';

Widget getErrorScreen(FlutterErrorDetails error) {
  return const ErrorScreen();
}

class ErrorScreen extends HookWidget {
  const ErrorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppConstant.trans,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: Container(
        color: AppConstant.backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                child: SizedBox(
                  width: 0.6.sw,
                  height: 35.h,
                  child: CustomButton(
                    onPressed: () {
                      Phoenix.rebirth(context);
                    },
                    title: 'Try Again',
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
