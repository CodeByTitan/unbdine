import './addon_class.dart';

class MyCart {
  final String foodID;
  final String foodName;
  final double foodPrice;
  final String foodImgUrl;
  final int quantity;
  final List<Addon> addons;
  MyCart({
    required this.foodID,
    required this.foodName,
    required this.foodPrice,
    required this.foodImgUrl,
    required this.quantity,
    required this.addons,
  });
}
