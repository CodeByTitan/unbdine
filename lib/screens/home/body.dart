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
late double menuTextStartPos;
late double menuTextEndPos;
late double miniTextStartPos;
late double miniTextEndPos;

class _BodyState extends State<Body> {
  void changepage(int i) {
    setState(() {
      menuTextStartPos = 0;
      menuTextEndPos = -50;
      miniTextStartPos = 0;
      miniTextEndPos = -200;
    });
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        pageController.animateToPage(
          i,
          duration: const Duration(
            seconds: 1,
          ),
          curve: Curves.easeInOutCirc,
        );
      },
    );
  }

  void backtoHome() {
    setState(() {
      menuTextStartPos = -50;
      menuTextEndPos = 0;
      miniTextStartPos = -200;
      miniTextEndPos = 0;
    });
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        pageController.animateToPage(
          0,
          duration: const Duration(
            seconds: 1,
          ),
          curve: Curves.easeOut,
        );
      },
    );
  }

  @override
  void initState() {
    menuTextStartPos = -50;
    menuTextEndPos = 0;
    miniTextStartPos = -200;
    miniTextEndPos = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          onPageChanged: (value) {
            if (value == 0) {
              setState(() {
                menuTextStartPos = -50;
                menuTextEndPos = 0;
                miniTextStartPos = -200;
                miniTextEndPos = 0;
              });
            }
          },
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
              menuTextStartPos: menuTextStartPos,
              menuTextEndPos: menuTextEndPos,
              miniTextStartPos: miniTextStartPos,
              miniTextEndPos: miniTextEndPos,
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
            bottomPadding: 15,
            buttonFunction: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
        ),
      ],
    );
  }
}
