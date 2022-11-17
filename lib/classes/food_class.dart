class Food {
  final String id;
  final String foodName;
  final double foodPrice;
  final bool isAvailable;
  final String foodImgUrl;
  final String shortDescription;
  final List<Addon> addOns;

  Food({
    required this.id,
    required this.foodName,
    required this.foodPrice,
    required this.isAvailable,
    required this.foodImgUrl,
    required this.shortDescription,
    required this.addOns,
  });
}

class Addon {
  final String id;
  final String addonName;
  final double addonPrice;
  Addon({
    required this.id,
    required this.addonName,
    required this.addonPrice,
  });
}

class OrderedFood {
  final String id;
  final String foodName;
  final double foodPrice;
  final String foodImgUrl;
  final int quantity;
  final List<Addon> addons;
  OrderedFood({
    required this.id,
    required this.foodName,
    required this.foodPrice,
    required this.foodImgUrl,
    required this.quantity,
    required this.addons,
  });
}
