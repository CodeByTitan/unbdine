import 'package:flutter/material.dart';

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
          width: MediaQuery.of(context).size.height * (3 / 8),
          height: MediaQuery.of(context).size.width * 0.12,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 20,
                offset: const Offset(0, 1),
              ),
            ],
            color: Theme.of(context).primaryColor,
          ),
          alignment: Alignment.center,
          child: Text(
            "MENU",
            textScaleFactor: 1.3,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  letterSpacing: 20,
                  fontFamily: 'BywayEMod',
                ),
          ),
        ),
      ),
    );
  }
}
