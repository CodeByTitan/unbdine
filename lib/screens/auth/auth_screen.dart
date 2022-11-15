import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../home/home.dart';

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
      appBar: AppBar(
        title: const Text('Unbdine'),
      ),
      body: StreamBuilder(
        initialData: null,
        stream: FirebaseAuth.instance.userChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          return Column(
            children: [
              const Center(
                child: Text(""),
                //  snapshot.data == null ? "Logged out" : "Logged In"),
              ),
              if (snapshot.data == null ||
                  snapshot.data?.isAnonymous == true) ...[
                ElevatedButton(
                  onPressed: () async {
                    debugPrint(
                        "PRESSED.........................................................................");
                    await performLogin("microsoft.com", ["email"],
                        {'tenant': '2f983bf7-f495-4e9a-a7a0-0f0c89c9062c'}
                        //  {"locale": "en"}
                        );
                  },
                  child: const Text("Sign in using  Microsoft"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const Text("Home"),
                ),
              ],
              if (snapshot.data != null) ...[
                ElevatedButton(
                  onPressed: () async {
                    await performLink(
                        "microsoft.com", ["email"], {"locale": "en"});
                  },
                  child: const Text("Link Sign in By Microsoft"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                  child: const Text("Logout"),
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}
