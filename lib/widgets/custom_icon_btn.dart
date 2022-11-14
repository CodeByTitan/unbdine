import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String buttontext;
  final Icon buttonIcon;
  final VoidCallback buttonFunction;
  const CustomIconButton(
      {super.key,
      required this.buttontext,
      required this.buttonIcon,
      required this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonFunction,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        height: 50,
        width: MediaQuery.of(context).size.width * 0.55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.green,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 20,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              buttontext,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            buttonIcon,
          ],
        ),
      ),
    );
  }
}
