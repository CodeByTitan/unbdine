class Food {
  final String id;
  final String foodName;
  final double foodPrice;
  final bool isAvailable;
  final String foodImgUrl;
  final String shortDescription;
  bool isFavorite;

  Food({
    required this.id,
    required this.foodName,
    required this.foodPrice,
    required this.isAvailable,
    required this.foodImgUrl,
    required this.shortDescription,
    this.isFavorite = false,
  });
}
