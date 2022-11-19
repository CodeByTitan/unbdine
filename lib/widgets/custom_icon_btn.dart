import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String buttontext;
  final Icon buttonIcon;
  final double bottomPadding;
  final VoidCallback buttonFunction;
  const CustomIconButton({
    super.key,
    required this.buttontext,
    required this.buttonIcon,
    required this.bottomPadding,
    required this.buttonFunction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonFunction,
      child: Container(
        margin: EdgeInsets.only(
          bottom: bottomPadding,
        ),
        height: 50,
        width: MediaQuery.of(context).size.width * 0.55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xFF019267),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 20,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              width: 15,
            ),
            Text(
              buttontext,
              textScaleFactor: 1.3,
            ),
            buttonIcon,
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
