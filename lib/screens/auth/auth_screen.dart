import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../home/home.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

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
                            frameRate: FrameRate(30),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 5,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Enjoy your meal',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 24,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 200),
                    Container(
                      padding: const EdgeInsets.all(17),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
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
                          Icon(
                            FontAwesomeIcons.microsoft,
                            color: Theme.of(context).primaryIconTheme.color,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Sign In with Microsoft Account",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
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
              ),
            );
          },
        ),
      ),
    );
  }
}
