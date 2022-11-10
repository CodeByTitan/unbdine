import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unbdine/widgets/expandable_container.dart';
import 'package:unbdine/widgets/stacked_food_type_text.dart';

class DashBoardTile extends StatelessWidget {
  final int tileID;
  final String text;
  final String imagePath;
  final void Function(bool) onExpanded;
  final List<Widget> widgets;
  final double heightFactor;
  final bool isVisible;
  const DashBoardTile({
    Key? key,
    required this.tileID,
    required this.text,
    required this.imagePath,
    required this.widgets,
    required this.onExpanded,
    required this.heightFactor,
    required this.isVisible,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * heightFactor,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                color: Theme.of(context).backgroundColor,
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.sp),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                          imagePath,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ExpandableContainer(
                      onExpanded: onExpanded,
                      widgets: widgets,
                    ),
                  ),
                ],
              ),
            ),
            StackedFoodTypeText(
              text: text,
            )
          ],
        ),
      ),
    );
  }
}
