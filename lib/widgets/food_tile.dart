import 'dart:math' as math;
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.black,
              Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(0.5),
            ],
          ),
        ),
        margin: const EdgeInsets.only(
          top: 55,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // TODO: Image
                Transform(
                  transform: Matrix4.skew(0, 0.4),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      /* borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(120),
                  ), */
                      color: Colors.black,
                    ),
                  ),
                ),
                // info text
                Container(
                  height: 75,
                  margin: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        foodName,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        '\$ $foodPrice',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        shortDescription,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // add to cart button
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: IconButton(
                // TODO: add to cart function
                onPressed: () {},
                icon: const Icon(
                  Icons.add_shopping_cart,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
