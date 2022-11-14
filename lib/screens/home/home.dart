import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:unbdine/screens/home/body.dart';
import 'package:unbdine/screens/drawer/drawer.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Morning';
  }
  if (hour < 17) {
    return 'Afternoon';
  }
  return 'Evening';
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.now();
    final appVersion = useState<String>('');
    final appName = useState<String>('');

    getAppInfo() async {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      appVersion.value = packageInfo.version;
      appName.value = packageInfo.appName;
    }

    useEffect(() {
      getAppInfo();
      return null;
    });

    return WillPopScope(
      onWillPop: () async {
        if (DateTime.now().difference(datetime) >= const Duration(seconds: 2)) {
          Fluttertoast.showToast(msg: 'Tap again to exit!');
          datetime = DateTime.now();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Good ${greeting()} user!',
          ),
          centerTitle: false,
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  child: CircleAvatar(
                    radius: 17.5,
                    // backgroundImage: widget.userData['photoURL'].isNotEmpty
                    //     ? NetworkImage(widget.userData['photoURL'].toString())
                    //     : null,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.person_rounded,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        drawer: DefaultDrawer(
          appName: appName.value,
          appVersion: appVersion.value,
          userAvatar: '',
          userName: '',
        ),
        body: const Body(),
      ),
    );
  }
}
