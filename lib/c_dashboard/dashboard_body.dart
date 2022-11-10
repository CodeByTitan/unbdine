import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unbdine/widgets/stacked_menu_text.dart';
import 'package:unbdine/widgets/stacked_food_type_text.dart';

class DashBoardBody extends StatelessWidget {
  const DashBoardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: const [
            ExpandableTile(
              text: 'Breakfast',
            ),
            ExpandableTile(
              text: 'Grill',
            ),
            ExpandableTile(
              text: 'Dinner',
            ),
          ],
        ),
        const StackedMenuText(),
      ],
    );
  }
}

class ExpandableTile extends StatelessWidget {
  final String text;
  const ExpandableTile({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10.sp),
            margin: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              color: Theme.of(context).backgroundColor,
            ),
          ),
          StackedFoodTypeText(
            text: text,
          )
        ],
      ),
    );
  }
}
