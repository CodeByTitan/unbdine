import 'package:flutter/material.dart';

class RequiredInfo extends StatefulWidget {
  const RequiredInfo({
    Key? key,
    required this.defSizedBox,
  }) : super(key: key);

  final Widget defSizedBox;

  @override
  State<RequiredInfo> createState() => _RequiredInfoState();
}

class _RequiredInfoState extends State<RequiredInfo> {
  TimeOfDay pickupTime = TimeOfDay.now();

  _setPickupTime() async {
    TimeOfDay currentTime = TimeOfDay.now();
    TimeOfDay pickedTime = await showTimePicker(
          context: context,
          helpText: 'Select Pickup Time',
          initialTime: TimeOfDay.now(),
        ) ??
        currentTime;
    int hourGap = pickedTime.hour - currentTime.hour;
    bool isCorrectPickupTime =
        ((hourGap * 60) + (pickedTime.minute - currentTime.minute) <= 180) &&
            (hourGap > 0);

    if (isCorrectPickupTime) {
      setState(() {
        pickupTime = pickedTime;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => const Dialog(
          child: SizedBox(
            height: 150,
            width: 150,
            child: Center(
              child: Text(
                'Invalid Time',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

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
          widget.defSizedBox,
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
          widget.defSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Set pickup time',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Row(
                children: [
                  Text(
                    '${pickupTime.hour} : ${pickupTime.minute}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // TODO
                  GestureDetector(
                    onTap: _setPickupTime,
                    child: const Icon(
                      Icons.schedule,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
          widget.defSizedBox,
          const Divider(),
          Text(
            'Remarks for Chef *',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          widget.defSizedBox,
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          )
        ],
      ),
    );
  }
}
