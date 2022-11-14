import 'package:flutter/material.dart';
import 'package:unbdine/widgets/custom_divider.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      userAvatar.isNotEmpty ? NetworkImage(userAvatar) : null,
                  child: userAvatar.isEmpty
                      ? const Icon(
                          Icons.person_rounded,
                          size: 25,
                        )
                      : null,
                ),
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    userName.isNotEmpty ? userName : 'user',
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomDivider(),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                },
                leading: const Icon(
                  Icons.history_rounded,
                ),
                title: Text(
                  'Order history',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                },
                leading: const Icon(
                  Icons.check_circle_rounded,
                ),
                title: Text(
                  'Saved meals',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                },
                leading: const Icon(
                  Icons.payment_rounded,
                ),
                title: Text(
                  'Payment methods',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const CustomDivider(),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                },
                leading: const Icon(
                  Icons.info_rounded,
                ),
                title: Text(
                  'Terms and conditions',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                },
                leading: const Icon(
                  Icons.feedback_rounded,
                ),
                title: Text(
                  'Feedback',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                },
                leading: const Icon(
                  Icons.star_rounded,
                ),
                title: Text(
                  'Rate us',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
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
                  title: Text(
                    'Logout',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  '$appName v$appVersion',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
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
