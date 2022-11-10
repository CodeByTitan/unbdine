// import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unbdine/widgets/stacked_food_type_text.dart';

class DashBoardTile extends StatelessWidget {
  final String text;
  final String imagePath;
  const DashBoardTile({
    Key? key,
    required this.text,
    required this.imagePath,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      child: Stack(
        children: [
          Container(
            // padding: EdgeInsets.all(10.sp),
            margin: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              color: Theme.of(context).backgroundColor,
              // gradient: LinearGradient(
              //   begin: Alignment.topRight,
              //   end: Alignment.bottomLeft,
              //   colors: [
              //     Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              //         .withOpacity(0.5),
              //     Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              //         .withOpacity(1.0),
              //   ],
              // ),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.sp),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image(
                      fit: BoxFit.fitWidth,
                      image: AssetImage(
                        imagePath,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          StackedFoodTypeText(
            text: text,
          )
        ],
      ),
    );
  }
}
