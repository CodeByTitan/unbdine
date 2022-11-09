import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/dummy_data.dart';
import '../../widgets/food_tile.dart';
import '../../widgets/food_type_chip.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key});

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  String _currfoodType = 'All';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.sp),
      padding: EdgeInsets.all(5.sp),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodTypes.length,
              itemBuilder: (context, index) => FoodTypeChips(
                onTap: () {
                  setState(() {
                    _currfoodType = foodTypes[index];
                  });
                },
                typeName: foodTypes[index],
                color: foodTypes[index] == _currfoodType
                    ? Theme.of(context).primaryColor.withOpacity(0.6)
                    : Theme.of(context).primaryColor.withOpacity(0.2),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: ListView.builder(
              itemCount: foodData.length,
              itemBuilder: (context, index) => FoodTile(
                foodName: foodData[index].foodName,
                isAvailable: foodData[index].isAvailable,
                shortDescription: foodData[index].shortDescription,
                foodPrice: foodData[index].foodPrice,
                isCurrType: _currfoodType == 'All'
                    ? true
                    : (foodData[index].type == _currfoodType),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
