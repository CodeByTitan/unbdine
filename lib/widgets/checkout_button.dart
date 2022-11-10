import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOutButton extends StatelessWidget {
  final VoidCallback onTap;
  const CheckOutButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(bottom: 15.sp),
          height: 50.sp,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            color: Colors.green,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2.sp,
                blurRadius: 20.sp,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Check Out",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const Icon(Icons.shopping_cart_checkout),
            ],
          ),
        ),
      ),
    );
  }
}
