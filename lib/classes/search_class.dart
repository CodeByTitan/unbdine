import 'package:flutter/material.dart';
import 'package:unbdine/screens/search_screen.dart';
import './food_class.dart';

class FoodSearchDelegate extends SearchDelegate {
  final List<Food> foodList;

  FoodSearchDelegate(this.foodList);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
      ),
      // hintColor: Colors.white,
      textTheme: theme.textTheme.copyWith(
        headline6: const TextStyle(
          fontSize: 18,
          color: Colors.black, // query Color
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Food> matchedFoodQuery = [];

    for (var index = 0; index < foodList.length; index++,) {
      if ((foodList[index].foodName.toLowerCase().replaceAll(' ', '')).contains(
        (query.toLowerCase().trim().replaceAll(' ', '')),
      )) {
        matchedFoodQuery.add(foodList[index]);
      }
    }

    return SearchScreen(
      foodList: matchedFoodQuery,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Food> suggestedFoodQuery = foodList.sublist(0, 5);
    List<Food> matchedFoodQuery = [];

    for (var index = 0; index < foodList.length; index++,) {
      if ((foodList[index].foodName.toLowerCase().replaceAll(' ', '')).contains(
        (query.toLowerCase().trim().replaceAll(' ', '')),
      )) {
        matchedFoodQuery.add(foodList[index]);
      }
    }
    return (query.isEmpty)
        ? SearchScreen(foodList: suggestedFoodQuery)
        : SearchScreen(foodList: matchedFoodQuery);
  }
}
