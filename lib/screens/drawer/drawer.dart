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
    return Drawer(
      child: SafeArea(
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
              Card(
                clipBehavior: Clip.hardEdge,
                elevation: 0,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  leading: const Icon(
                    Icons.logout_rounded,
                  ),
                  title: const Text(
                    'Logout',
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  '$appName v$appVersion',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
