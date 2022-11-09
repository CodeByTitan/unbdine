import 'package:flutter/material.dart';

import '../../classes/search_class.dart';
import '../../services/greetings.dart';
import '../../utils/app_constant.dart';
import '../../data/dummy_data.dart';
import './dashboard_drawer.dart';
import './dashboard_body.dart';

class DashboardScaffold extends StatelessWidget {
  const DashboardScaffold({
    Key? key,
    required this.appName,
    required this.appVersion,
  }) : super(key: key);

  final String appName;
  final String appVersion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Good ${greeting()} user!',
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: FoodSearchDelegate(
                  foodData,
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: AppConstant.primaryColor,
                child: CircleAvatar(
                  radius: 17.5,
                  backgroundColor: AppConstant.backgroundColor,
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
                      color: AppConstant.titlecolor,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      drawer: DashboardDrawer(
        appName: appName,
        appVersion: appVersion,
        userAvatar: '',
        userName: '',
      ),
      body: const DashboardBody(),
    );
  }
}
