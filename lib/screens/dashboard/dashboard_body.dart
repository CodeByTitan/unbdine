import 'package:flutter/material.dart';
import 'package:unbdine/screens/cart/cart_screen.dart';
import 'package:unbdine/data/dummy_data.dart';
import 'package:unbdine/widgets/custom_icon_btn.dart';
import 'package:unbdine/widgets/dashboard_tile.dart';
import 'package:unbdine/widgets/stacked_menu_text.dart';

class DashBoardBody extends StatefulWidget {
  const DashBoardBody({super.key});

  @override
  State<DashBoardBody> createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends State<DashBoardBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          children: [
            // homepage
            Stack(
              children: [
                Column(
                  children: [
                    DashBoardTile(
                      text: food[0][0],
                      imagePath: food[0][1],
                      onClicked: () {},
                    ),
                    DashBoardTile(
                      text: food[1][0],
                      imagePath: food[1][1],
                      onClicked: () {},
                    ),
                    DashBoardTile(
                      text: food[2][0],
                      imagePath: food[2][1],
                      onClicked: () {},
                    ),
                  ],
                ),
                const StackedMenuText(),
              ],
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomIconButton(
            buttontext: 'Check Out',
            buttonIcon: const Icon(Icons.shopping_cart_checkout),
            buttonFunction: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
        ),
      ],
    );
  }
}
