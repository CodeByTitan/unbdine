import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../classes/food_class.dart';
import '../widgets/food_tile.dart';

class SearchScreen extends StatelessWidget {
  final List<Food> foodList;
  const SearchScreen({
    super.key,
    required this.foodList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10.sp),
      itemCount: foodList.length,
      itemBuilder: (context, index) => FoodTile(
        foodName: foodList[index].foodName,
        isAvailable: foodList[index].isAvailable,
        shortDescription: foodList[index].shortDescription,
        foodPrice: foodList[index].foodPrice,
      ),
    );
  }
}
