import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {
  final String foodName;
  final bool isAvailable;
  final String shortDescription;
  final double foodPrice;
  final bool isCurrType;

  const FoodTile({
    super.key,
    required this.foodName,
    required this.isAvailable,
    required this.shortDescription,
    required this.foodPrice,
    required this.isCurrType,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isCurrType,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
          ),
          color: isAvailable ? Colors.white : Colors.grey,
        ),
        margin: const EdgeInsets.only(
          top: 5,
        ),
        height: 100,
        child: Center(
          child: ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              width: 75,
            ), // TODO : image
            title: Text(foodName),
            subtitle: Text(shortDescription),
            trailing: Text('\$ $foodPrice'),
          ),
        ),
      ),
    );
  }
}
