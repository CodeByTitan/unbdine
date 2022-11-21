import 'dart:math' as math;
import 'package:flutter/material.dart';

import './stacked_food_type_text.dart';

class MainMenuTile extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback onClicked;
  final double miniTextStartPos; //-200
  final double miniTextEndPos; // 0
  const MainMenuTile({
    Key? key,
    required this.text,
    required this.imagePath,
    required this.onClicked,
    required this.miniTextStartPos,
    required this.miniTextEndPos,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      child: Stack(
        children: [
          // Image
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 10,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    imagePath,
                  ),
                ),
              ),
            ),
          ),
          // Navigation
          GestureDetector(
            onTap: onClicked,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.black,
                      Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(0.7),
                      Colors.black45,
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 60,
                        ),
                        Text(
                          'Explore',
                          textScaleFactor: 1.1,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.keyboard_arrow_down,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Title

          TweenAnimationBuilder(
            tween: Tween<double>(
              begin: miniTextStartPos,
              end: miniTextEndPos,
            ),
            curve: Curves.easeInOut,
            duration: const Duration(
              milliseconds: 750,
            ),
            builder: (_, double val, child) {
              return Positioned(
                right: val,
                child: child!,
              );
            },
            child: StackedFoodTypeText(
              text: text,
            ),
          ),
        ],
      ),
    );
  }
}
