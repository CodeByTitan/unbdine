import 'package:flutter/material.dart';

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
        width: 100,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.center,
        child: Text(
          typeName,
        ),
      ),
    );
  }
}
