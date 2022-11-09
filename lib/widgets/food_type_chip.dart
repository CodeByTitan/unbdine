import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodTypeChips extends StatelessWidget {
  final void Function() onTap;
  final String typeName;
  final Color? color;
  const FoodTypeChips({
    super.key,
    required this.onTap,
    required this.typeName,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.sp,
        padding: EdgeInsets.all(10.sp),
        margin: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30.sp),
        ),
        alignment: Alignment.center,
        child: Text(
          typeName,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
