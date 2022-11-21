import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../data/university_data.dart';
import '../university_selector/unv_search_delegate.dart';

class UnSelScreen extends StatelessWidget {
  const UnSelScreen({super.key});
  static const routeName = '/un-sel-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFbfc6e0),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                ),
                RichText(
                  text: const TextSpan(
                    text: 'University',
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 5,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'DINE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 28,
                          letterSpacing: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                Lottie.asset(
                  'assets/animations/the-yard.json',
                  fit: BoxFit.fitWidth,
                  frameRate: FrameRate(30),
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                const Text('Don\'t wait for Food, let the food wait'),
              ],
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(
                begin: -200,
                end: 0,
              ),
              curve: Curves.easeInOut,
              duration: const Duration(
                seconds: 1,
              ),
              builder: (_, double val, child) {
                return Positioned(
                  bottom: val,
                  width: MediaQuery.of(context).size.width,
                  child: child!,
                );
              },
              child: GestureDetector(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: UNVSearchDelegate(universityList),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.13,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/icons/school.png'),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Search Your',
                            style: TextStyle(
                              letterSpacing: 3,
                            ),
                          ),
                          Text(
                            'University',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(
                begin: -200,
                end: 0,
              ),
              curve: Curves.easeInOut,
              duration: const Duration(
                seconds: 2,
              ),
              builder: (_, double val, child) {
                return Positioned(
                  top: val,
                  child: child!,
                );
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Image.asset(
                    'assets/images/platewforks.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
