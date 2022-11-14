import 'package:flutter/material.dart';

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
        margin: const EdgeInsets.only(
          top: 20,
        ),
        height: 40,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
          color: Theme.of(context).primaryColorDark,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 20,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          textScaleFactor: 1.1,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
