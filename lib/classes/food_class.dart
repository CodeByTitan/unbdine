import 'package:unbdine/classes/choices_class.dart';

import './addon_class.dart';

class Food {
  final String foodID;
  final String foodName;
  final double foodPrice;
  final bool isAvailable;
  final String foodImgUrl;
  final String shortDescription;
  final List<Addon> addOns;
  final List<Choice> choices;

  Food({
    required this.foodID,
    required this.foodName,
    required this.foodPrice,
    required this.isAvailable,
    required this.foodImgUrl,
    required this.shortDescription,
    required this.addOns,
    required this.choices,
  });
}
