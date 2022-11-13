import 'package:flutter/material.dart';
import 'package:unbdine/classes/food_class.dart';
import 'package:unbdine/utils/app_constant.dart';
import 'package:unbdine/widgets/food_tile.dart';

class SubMenuBuilder extends StatelessWidget {
  final int subMenuIndex;
  final List menu;
  final List<Food> submenu;
  final VoidCallback backToMenu;
  const SubMenuBuilder({
    super.key,
    required this.subMenuIndex,
    required this.menu,
    required this.submenu,
    required this.backToMenu,
  });

  @override
  Widget build(BuildContext context) {
    return /* WillPopScope(
      onWillPop: () async {
        backToMenu();
        return false;
      },
      child: */
        Stack(
      children: [
        // Food List
        Transform(
          transform: Matrix4.skewY(-0.2),
          child: Container(
            margin: const EdgeInsets.only(
              top: 100,
              left: 15,
              right: 15,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: submenu.length,
              itemBuilder: (_, i) => FoodTile(
                foodName: submenu[i].foodName,
                isAvailable: submenu[i].isAvailable,
                shortDescription: submenu[i].shortDescription,
                foodPrice: submenu[i].foodPrice,
              ),
            ),
          ),
        ),
        // Header Image
        Align(
          alignment: Alignment.topCenter,
          child: Transform(
            transform: Matrix4.skewY(-0.2),
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5),
                        BlendMode.darken,
                      ),
                      image: ExactAssetImage(menu[subMenuIndex][1]),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                    left: 30,
                    bottom: 15,
                  ),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    menu[subMenuIndex][0],
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: backToMenu,
            child: Container(
              width: 100,
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    AppConstant.primaryColor,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    Icons.navigate_before,
                  ),
                  Text(
                    'Menu',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      /* ), */
    );
  }
}
