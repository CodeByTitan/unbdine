import 'package:flutter/material.dart';
import 'package:unbdine/data/dummy_data.dart';
import 'package:unbdine/widgets/main_menu_tile.dart';
import 'package:unbdine/widgets/stacked_menu_text.dart';

class MainMenu extends StatelessWidget {
  final VoidCallback toBreakfast;
  final VoidCallback toGrill;
  final VoidCallback toDinner;

  const MainMenu({
    super.key,
    required this.toBreakfast,
    required this.toGrill,
    required this.toDinner,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            MainMenuTile(
              text: food[0][0],
              imagePath: food[0][1],
              onClicked: toBreakfast,
            ),
            MainMenuTile(
              text: food[1][0],
              imagePath: food[1][1],
              onClicked: toGrill,
            ),
            MainMenuTile(
              text: food[2][0],
              imagePath: food[2][1],
              onClicked: toDinner,
            ),
          ],
        ),
        const StackedMenuText(),
      ],
    );
  }
}
