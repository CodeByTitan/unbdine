import 'package:flutter/material.dart';

import './main_menu.dart';
import './sub_menu_builder.dart';
import '../cart/cart_screen.dart';
import '../../widgets/custom_icon_btn.dart';
import '../../data/dummy_data.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

PageController pageController = PageController(
  initialPage: 0,
  keepPage: true,
);

class _BodyState extends State<Body> {
  void changepage(int i) {
    pageController.animateToPage(
      i,
      duration: const Duration(
        seconds: 1,
      ),
      curve: Curves.easeInOut,
    );
  }

  void backtoHome() {
    changepage(0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: pageController,
          scrollDirection: Axis.vertical,
          children: [
            MainMenu(
              toBreakfast: () {
                changepage(1);
              },
              toGrill: () {
                changepage(2);
              },
              toDinner: () {
                changepage(3);
              },
            ),
            SubMenuBuilder(
              subMenuIndex: 0,
              menu: food,
              submenu: breakfast,
              backToMenu: backtoHome,
            ),
            SubMenuBuilder(
              subMenuIndex: 1,
              menu: food,
              submenu: grill,
              backToMenu: backtoHome,
            ),
            SubMenuBuilder(
              subMenuIndex: 2,
              menu: food,
              submenu: dinner,
              backToMenu: backtoHome,
            ),
          ],
        ),
        // Check out Button
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomIconButton(
            buttontext: 'My Cart',
            buttonIcon: const Icon(Icons.shopping_cart),
            buttonFunction: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
        ),
      ],
    );
  }
}
