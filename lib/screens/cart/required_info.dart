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
        crossAxisAlignment: CrossAxisAlignment.start,
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
              GestureDetector(
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                },
                child: const Icon(
                  Icons.schedule,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          defSizedBox,
          const Divider(),
          Text(
            'Remarks for Chef *',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          defSizedBox,
          const TextField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.multiline,
            // onEditingComplete: ,
            // controller: ,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintText: 'Add less garlic',
            ),
          ),
        ],
      ),
    );
  }
}
