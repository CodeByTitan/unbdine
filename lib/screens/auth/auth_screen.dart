import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:unbdine/screens/home/home.dart';

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
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Lottie.asset(
                          'assets/animations/logInFood.json',
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      const Positioned(
                        left: 0,
                        right: 0,
                        bottom: 10,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Enjoy your meal',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 200),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.email,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Sign In with Microsoft Account",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
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
