import 'package:flutter/material.dart';

import '../../data/food_type_data.dart';
import '../../widgets/main_menu_tile.dart';
import '../../widgets/stacked_menu_text.dart';

class MainMenu extends StatelessWidget {
  final VoidCallback toBreakfast;
  final VoidCallback toGrill;
  final VoidCallback toDinner;
  final double miniTextStartPos;
  final double miniTextEndPos;
  final double menuTextStartPos;
  final double menuTextEndPos;

  const MainMenu({
    super.key,
    required this.toBreakfast,
    required this.toGrill,
    required this.toDinner,
    required this.miniTextStartPos,
    required this.miniTextEndPos,
    required this.menuTextStartPos,
    required this.menuTextEndPos,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              MainMenuTile(
                text: food[0][0],
                imagePath: food[0][1],
                onClicked: toBreakfast,
                miniTextStartPos: miniTextStartPos,
                miniTextEndPos: miniTextEndPos,
              ),
              MainMenuTile(
                text: food[1][0],
                imagePath: food[1][1],
                onClicked: toGrill,
                miniTextStartPos: miniTextStartPos,
                miniTextEndPos: miniTextEndPos,
              ),
              MainMenuTile(
                text: food[2][0],
                imagePath: food[2][1],
                miniTextStartPos: miniTextStartPos,
                miniTextEndPos: miniTextEndPos,
                onClicked: toDinner,
              ),
            ],
          ),
        ),
        TweenAnimationBuilder(
          tween: Tween<double>(
            begin: menuTextStartPos,
            end: menuTextEndPos,
          ),
          builder: (_, double val, child) {
            return Positioned(
              left: val,
              top: MediaQuery.of(context).size.height * 0.2,
              child: child!,
            );
          },
          curve: Curves.easeInOut,
          duration: const Duration(
            milliseconds: 1000,
          ),
          child: const StackedMenuText(),
        ),
      ],
    );
  }
}
