import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:lottie/lottie.dart';

import '../home/home.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});
  static const routeName = '/auth-screen';

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
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
    return SafeArea(
      child: Scaffold(
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
                  opacity: 0.7,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Lottie.asset(
                          'assets/animations/logInFood.json',
                          filterQuality: FilterQuality.high,
                          frameRate: FrameRate(30),
                        ),
                      ),
                    ],
                  ),
                  // sign in Button
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(HomeScreen.routeName);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      width: MediaQuery.of(context).size.width * 0.7,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 20,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: Image.asset('assets/icons/microsoft.png'),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sign in with",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 12,
                                    ),
                              ),
                              Text(
                                "Microsoft Account",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  /* Center(
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
                  ), */

                  //  Center(
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
                  //     child:  Text(
                  //       "Sign in using  Microsoft",
                  //     ),
                  //   ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) =>  DashboardScreen(),
                  //       ),
                  //     );
                  //   },
                  //   child:  Text(
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
                  //     child:  Text(
                  //       "Link Sign in By Microsoft",
                  //     ),
                  //   ),
                  //   ElevatedButton(
                  //     onPressed: () async {
                  //       await FirebaseAuth.instance.signOut();
                  //     },
                  //     child:  Text(
                  //       "Logout",
                  //     ),
                  //   ),
                  // ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
