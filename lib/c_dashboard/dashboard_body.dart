import 'package:flutter/material.dart';
import 'package:unbdine/c_dashboard/cart/cart_screen.dart';
import 'package:unbdine/widgets/custom_icon_btn.dart';
import 'package:unbdine/widgets/dashboard_tiles.dart';
import 'package:unbdine/widgets/stacked_menu_text.dart';

class DashBoardBody extends StatefulWidget {
  const DashBoardBody({super.key});

  @override
  State<DashBoardBody> createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends State<DashBoardBody> {
  List foodtype = [
    ['Breakfirst', 'assets/images/breakfirst.jpg'],
    ['grill', 'assets/images/grill.jpg'],
    ['Dinner', 'assets/images/dinner.jpg'],
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: foodtype.length,
          itemBuilder: (_, i) => DashBoardTile(
            text: foodtype[i][0],
            imagePath: foodtype[i][1],
          ),
        ),
        const StackedMenuText(),
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
