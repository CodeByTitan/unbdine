import 'package:flutter/material.dart';
import 'package:unbdine/widgets/checkout_button.dart';
import 'package:unbdine/widgets/dashboard_tiles.dart';
import 'package:unbdine/widgets/stacked_menu_text.dart';

class DashBoardBody extends StatefulWidget {
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
  State<DashBoardBody> createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends State<DashBoardBody> {
  List<String> foodtype = [
    'Breakfirst',
    'grill',
    'Dinner',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: foodtype.length,
          itemBuilder: (context, index) => ExpandableTile(
            text: foodtype[index],
          ),
        ),
        const StackedMenuText(),
        CheckOutButton(
          //TODO : Connect to cart UI
          onTap: () {},
        )
      ],
    );
  }
}
