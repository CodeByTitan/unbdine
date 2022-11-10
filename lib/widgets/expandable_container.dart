import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableContainer extends StatelessWidget {
  final List<Widget> widgets;
  final void Function(bool) onExpanded;
  const ExpandableContainer({
    Key? key,
    required this.widgets,
    required this.onExpanded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.sp),
          bottomRight: Radius.circular(15.sp),
        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.black,
            Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.7),
            Colors.black45,
          ],
        ),
      ),
      child: ExpansionTile(
        onExpansionChanged: onExpanded,
        title: const Text(
          'Explore',
          textScaleFactor: 1.5,
        ),
        leading: const SizedBox(
          width: 40,
        ),
        children: widgets,
      ),
    );
  }
}
