import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:unbdine/classes/abstract_search_delegate.dart';

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
                  text: TextSpan(
                    text: 'University',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 28,
                          letterSpacing: 2,
                          fontFamily: 'BywayEMod',
                        ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' DINE',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 28,
                              letterSpacing: 3,
                              fontFamily: 'BywayEMod',
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
                Text(
                  'Don\'t wait for Food, let the food wait',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
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
                  showPlatformSearch(
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
                        children: [
                          Text(
                            'Search Your',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      letterSpacing: 3,
                                    ),
                          ),
                          Text(
                            'University',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 24,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w800,
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
