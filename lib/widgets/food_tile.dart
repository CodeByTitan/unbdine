import 'dart:math' as math;
import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {
  final String foodName;
  final bool isAvailable;
  final String shortDescription;
  final double foodPrice;
  final VoidCallback addToCart;

  const FoodTile({
    super.key,
    required this.foodName,
    required this.isAvailable,
    required this.shortDescription,
    required this.foodPrice,
    required this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isAvailable,
      child: TweenAnimationBuilder(
        tween: Tween<double>(
          begin: 0,
          end: 1,
        ),
        curve: Curves.easeInOut,
        duration: const Duration(
          milliseconds: 500,
        ),
        builder: (_, double opacity, child) {
          return Opacity(
            opacity: opacity,
            child: child,
          );
        },
        child: Container(
          // width: 200,
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
            bottom: 45,
            top: 10,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transform(
                transform: Matrix4.skew(0, 0.4),
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
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
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      '\$ $foodPrice',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      shortDescription,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // add to cart button
              IconButton(
                onPressed: addToCart,
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
