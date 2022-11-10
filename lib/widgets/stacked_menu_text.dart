import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StackedMenuText extends StatelessWidget {
  const StackedMenuText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RotatedBox(
        quarterTurns: 3,
        child: Container(
          width: MediaQuery.of(context).size.height * (3 / 7),
          height: MediaQuery.of(context).size.width * 0.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.sp),
              bottomRight: Radius.circular(15.sp),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2.sp,
                blurRadius: 20.sp,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          alignment: Alignment.center,
          child: Text(
            "MENU",
            textScaleFactor: 1.3,
            style: TextStyle(
              letterSpacing: 35.sp,
            ),
          ),
        ),
      ),
    );
  }
}
