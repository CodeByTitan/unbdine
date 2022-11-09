import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unbdine/b_authentication/authentication_screen.dart';
import 'package:unbdine/utils/app_constant.dart';

class SplashScreen extends StatefulHookConsumerWidget {
  const SplashScreen({
    super.key,
  });

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
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
    return Stack(
      children: [
        Container(
          height: 1.sh,
          width: 1.sw,
          decoration: const BoxDecoration(
            color: AppConstant.backgroundColor,
          ),
        ),
        Center(
          child: FlutterLogo(
            size: 100.sp,
          ),
        ),
      ],
    );
  }
}
