import 'package:flutter/material.dart';

import 'package:unbdine/services/greetings.dart';
import 'package:unbdine/utils/app_constant.dart';
import 'package:unbdine/c_dashboard/dashboard_drawer.dart';
import 'package:unbdine/c_dashboard/dashboard_body.dart';


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

      body: const DashBoardBody(),
      /* ListView(

        children: const [
          ExpansionTileCard(
            title: 'Breakfast',
            items: ['items1', 'items2', 'items3'],
          ),
          ExpansionTileCard(
            title: 'Grill',
            items: ['items1', 'items2', 'items3'],
          ),
          ExpansionTileCard(
            title: 'Dinner',
            items: ['items1', 'items2', 'items3'],
          ),
        ],

      ), */

    );
  }
}

class ExpansionTileCard extends StatelessWidget {
  const ExpansionTileCard({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          color: AppConstant.secondaryColor,
        ),
        padding: const EdgeInsets.all(20.0),
        child: ExpansionTile(
          backgroundColor: AppConstant.secondaryColor,
          title: Text(title),
          children: [
            ListView.builder(
              itemCount: items.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    items[index],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
