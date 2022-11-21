import 'package:flutter/material.dart';

import '../../data/dummy_data.dart';
import '../../widgets/custom_icon_btn.dart';
import '../cart/cart_screen.dart';
import '../drawer.dart';
import './main_menu.dart';
import './sub_menu_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

PageController pageController = PageController(
  initialPage: 0,
  keepPage: true,
);
late double menuTextStartPos;
late double menuTextEndPos;
late double miniTextStartPos;
late double miniTextEndPos;

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Morning';
  }
  if (hour < 17) {
    return 'Afternoon';
  }
  return 'Evening';
}

class _HomeScreenState extends State<HomeScreen> {
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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Good ${greeting()} user!',
          ),
          centerTitle: true,
        ),
        drawer: const DefaultDrawer(),
        body: Stack(
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
            // My Cart Button
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
        ),
      ),
    );
  }
}
