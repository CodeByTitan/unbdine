import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodTile extends StatelessWidget {
  final String foodName;
  final bool isAvailable;
  final String shortDescription;
  final double foodPrice;
  final bool? isCurrType;

  const FoodTile({
    super.key,
    required this.foodName,
    required this.isAvailable,
    required this.shortDescription,
    required this.foodPrice,
    this.isCurrType,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isCurrType ?? true,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(
            width: 1.sp,
          ),
          color: isAvailable ? Colors.white : Colors.red[100],
        ),
        margin: EdgeInsets.only(
          top: 5.sp,
        ),
        height: 100.sp,
        child: Center(
          child: ListTile(
            // TODO : food image in leading
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                border: Border.all(),
              ),
              width: 75.sp,
            ),
            title: Text(
              foodName,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            subtitle: Text(
              shortDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: Text(
              '\$ $foodPrice',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
