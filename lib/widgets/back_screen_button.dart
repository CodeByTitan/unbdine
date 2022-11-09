import 'package:flutter/material.dart';

class BackScreenButton extends StatelessWidget {
  const BackScreenButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.keyboard_arrow_left_rounded,
      ),
    );
  }
}