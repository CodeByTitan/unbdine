import 'package:flutter/material.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({
    Key? key,
    required this.appName,
    required this.appVersion,
    required this.userName,
    required this.userAvatar,
  }) : super(key: key);

  final String appName;
  final String appVersion;
  final String userName;
  final String userAvatar;

  @override
  Widget build(BuildContext context) {
    const Widget divSizedBox = SizedBox(
      height: 5,
    );
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          leading: userAvatar.isEmpty
              ? const Icon(
                  Icons.person_rounded,
                )
              : null,
          title: Text(
            userName.isNotEmpty ? userName : 'user name',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        body: Column(
          children: [
            divSizedBox,
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: const Icon(
                Icons.history_rounded,
              ),
              title: const Text(
                'Order history',
              ),
            ),
            divSizedBox,
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: const Icon(
                Icons.check_circle_rounded,
              ),
              title: const Text(
                'Saved meals',
              ),
            ),
            divSizedBox,
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: const Icon(
                Icons.payment_rounded,
              ),
              title: const Text(
                'Payment methods',
              ),
            ),
            divSizedBox,
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: const Icon(
                Icons.info_rounded,
              ),
              title: const Text(
                'Terms and conditions',
              ),
            ),
            divSizedBox,
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: const Icon(
                Icons.feedback_rounded,
              ),
              title: const Text(
                'Feedback',
              ),
            ),
            divSizedBox,
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: const Icon(
                Icons.star_rounded,
              ),
              title: const Text(
                'Rate us',
              ),
            ),
            const Spacer(),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: Icon(
                Icons.logout_rounded,
                color: Theme.of(context).errorColor,
              ),
              title: const Text(
                'Logout',
              ),
            ),
            divSizedBox,
            Center(
              child: Text(
                '$appName v$appVersion',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            divSizedBox,
          ],
        ),
      ),
    );
  }
}
