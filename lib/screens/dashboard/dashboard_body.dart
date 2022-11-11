import 'package:flutter/material.dart';
import 'package:unbdine/data/dummy_data.dart';
import 'package:unbdine/screens/cart/cart_screen.dart';
import 'package:unbdine/screens/pages/main_menu.dart';
import 'package:unbdine/screens/pages/sub_menu_builder.dart';
import 'package:unbdine/widgets/custom_icon_btn.dart';

class DashBoardBody extends StatefulWidget {
  const DashBoardBody({super.key});

  @override
  State<DashBoardBody> createState() => _DashBoardBodyState();
}

PageController pageController = PageController(
  initialPage: 0,
  keepPage: true,
);

class _DashBoardBodyState extends State<DashBoardBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // TODO
        PageView(
          controller: pageController,
          scrollDirection: Axis.vertical,
          children: [
            MainMenu(
              toBreakfast: () {
                pageController.animateToPage(
                  1,
                  duration: const Duration(
                    seconds: 1,
                  ),
                  curve: Curves.easeInOut,
                );
              },
              toGrill: () {
                pageController.animateToPage(
                  2,
                  duration: const Duration(
                    seconds: 1,
                  ),
                  curve: Curves.easeInOut,
                );
              },
              toDinner: () {
                pageController.animateToPage(
                  3,
                  duration: const Duration(
                    seconds: 1,
                  ),
                  curve: Curves.easeInOut,
                );
              },
            ),
            SubMenuBuilder(
              subMenuIndex: 0,
              menu: food,
              submenu: breakfast,
              backToMenu: () {
                pageController.animateToPage(
                  0,
                  duration: const Duration(
                    seconds: 1,
                  ),
                  curve: Curves.easeInOut,
                );
              },
            ),
            SubMenuBuilder(
              subMenuIndex: 1,
              menu: food,
              submenu: grill,
              backToMenu: () {
                pageController.animateToPage(
                  0,
                  duration: const Duration(
                    seconds: 1,
                  ),
                  curve: Curves.easeInOut,
                );
              },
            ),
            SubMenuBuilder(
              subMenuIndex: 2,
              menu: food,
              submenu: dinner,
              backToMenu: () {
                pageController.animateToPage(
                  0,
                  duration: const Duration(
                    seconds: 1,
                  ),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ],
        ),
        // Check out Button
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
