import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {
  final String foodName;
  final bool isAvailable;
  final String shortDescription;
  final double foodPrice;

  const FoodTile({
    super.key,
    required this.foodName,
    required this.isAvailable,
    required this.shortDescription,
    required this.foodPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isAvailable,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 120,
        color: Colors.red,
        margin: const EdgeInsets.all(5),

        alignment: Alignment.center,
        //TODO
        // child: ,
      ),
    );
  }
}
