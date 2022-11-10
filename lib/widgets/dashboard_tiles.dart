import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unbdine/widgets/stacked_food_type_text.dart';

class ExpandableTile extends StatelessWidget {
  final String text;
  const ExpandableTile({
    Key? key,
    required this.text,
  }) : super(key: key);
// TODO : Linear Gradient Effect
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10.sp),
            margin: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              color: Theme.of(context).backgroundColor,
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
