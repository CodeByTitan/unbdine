import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/food_tile.dart';
import '../widgets/food_type_chip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currfoodType = 'All';

  onChipClicked(selectedFoodType) {
    setState(() {
      _currfoodType = selectedFoodType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('UNBDine'),
        leading: IconButton(
          // TODO
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
        ),
        actions: [
          IconButton(
            // TODO
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(5),
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
                      ? Theme.of(context).primaryColor
                      : Colors.blue[100],
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
      ),
    );
  }
}
