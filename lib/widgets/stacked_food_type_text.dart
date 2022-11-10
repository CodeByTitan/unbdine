import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StackedFoodTypeText extends StatelessWidget {
  const StackedFoodTypeText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(
          top: 20.sp,
        ),
        height: 40.sp,
        width: 150.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.sp),
            topLeft: Radius.circular(10.sp),
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2.sp,
              blurRadius: 20.sp,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
