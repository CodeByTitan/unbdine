import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:unbdine/screens/dashboard/dashboard_screen.dart';

class AuthenticationScreen extends StatefulHookConsumerWidget {
  const AuthenticationScreen({super.key});

  @override
  ConsumerState<AuthenticationScreen> createState() =>
      _AuthenticationScreenState();
}

class _AuthenticationScreenState extends ConsumerState<AuthenticationScreen> {
  Future<void> performLogin(String provider, List<String> scopes,
      Map<String, String> parameters) async {
    try {
      await FirebaseAuthOAuth().openSignInFlow(provider, scopes, parameters);
    } on PlatformException catch (error) {
      debugPrint("${error.code}: ${error.message}");
    }
  }

  Future<void> performLink(String provider, List<String> scopes,
      Map<String, String> parameters) async {
    try {
      await FirebaseAuthOAuth()
          .linkExistingUserWithCredentials(provider, scopes, parameters);
    } on PlatformException catch (error) {
      debugPrint("${error.code}: ${error.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        initialData: null,
        stream: FirebaseAuth.instance.userChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          return Container(
            height: 1.sh,
            width: 1.sw,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/logInBg.jpg',
                ),
                fit: BoxFit.cover,
                opacity: 0.5,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 300.h,
                        width: 1.sw,
                        alignment: Alignment.center,
                        child: Lottie.asset(
                          'assets/animations/logInFood.json',
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      Positioned(
                        left: 0.w,
                        right: 0.w,
                        bottom: 10.h,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Enjoy your meal',
                            style: TextStyle(
                              fontSize: 25.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 200.h,
                  ),
                  Container(
                    height: 45.h,
                    width: 1.sw,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(
                        10.r,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.email,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Sign In with Microsoft Account",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Home",
                      ),
                    ),
                  ),

                  // const Center(
                  //   child: Text(""),
                  //   //  snapshot.data == null ? "Logged out" : "Logged In"),
                  // ),
                  // if (snapshot.data == null ||
                  //     snapshot.data?.isAnonymous == true) ...[
                  //   ElevatedButton(
                  //     onPressed: () async {
                  //       debugPrint(
                  //           "PRESSED.........................................................................");
                  //       await performLogin("microsoft.com", ["email"],
                  //           {'tenant': '2f983bf7-f495-4e9a-a7a0-0f0c89c9062c'}
                  //           //  {"locale": "en"}
                  //           );
                  //     },
                  //     child: const Text(
                  //       "Sign in using  Microsoft",
                  //     ),
                  //   ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => const DashboardScreen(),
                  //       ),
                  //     );
                  //   },
                  //   child: const Text(
                  //     "Home",
                  //   ),
                  // ),
                  // ],
                  // if (snapshot.data != null) ...[
                  //   ElevatedButton(
                  //     onPressed: () async {
                  //       await performLink(
                  //           "microsoft.com", ["email"], {"locale": "en"});
                  //     },
                  //     child: const Text(
                  //       "Link Sign in By Microsoft",
                  //     ),
                  //   ),
                  //   ElevatedButton(
                  //     onPressed: () async {
                  //       await FirebaseAuth.instance.signOut();
                  //     },
                  //     child: const Text(
                  //       "Logout",
                  //     ),
                  //   ),
                  // ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
