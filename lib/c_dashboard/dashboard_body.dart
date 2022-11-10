import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unbdine/c_dashboard/cart/cart_screen.dart';
import 'package:unbdine/data/dummy_data.dart';
import 'package:unbdine/widgets/custom_icon_btn.dart';
import 'package:unbdine/widgets/dashboard_tiles.dart';
import 'package:unbdine/widgets/stacked_menu_text.dart';

class DashBoardBody extends StatefulWidget {
  const DashBoardBody({super.key});

  @override
  State<DashBoardBody> createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends State<DashBoardBody> {
  bool isTileExpanded = false;
  int currTileID = -1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: food.length,
          itemBuilder: (_, i) => DashBoardTile(
            tileID: i,
            text: food[i][0],
            imagePath: food[i][1],
            widgets: [
              // TODO
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 30,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 15,
                    ),
                    height: 40.h,
                    width: MediaQuery.of(context).size.width * 0.7,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
            onExpanded: (isExpanded) {
              setState(
                () {
                  isTileExpanded = isExpanded;
                  currTileID = i;
                },
              );
            },
            heightFactor: (currTileID == i && isTileExpanded) ? 0.85 : 0.28,
            isVisible: !(currTileID != i && isTileExpanded),
          ),
        ),
        StackedMenuText(
          visible: !isTileExpanded,
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
