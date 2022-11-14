import 'package:flutter/material.dart';

class RequiredInfo extends StatelessWidget {
  const RequiredInfo({
    Key? key,
    required this.defSizedBox,
  }) : super(key: key);

  final Widget defSizedBox;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const CircleAvatar(
                backgroundColor: Colors.green,
                radius: 7,
              ),
            ],
          ),
          defSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Set pickup time',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          defSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Remarks for Chef *',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
