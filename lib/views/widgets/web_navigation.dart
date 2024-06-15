import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/home_menu_controller.dart';

class Navigation extends StatelessWidget {
  final HomeMenuController pageMenuController = Get.find();

  @override
  Widget build(BuildContext context) {
    onTap(index) {
      pageMenuController.changePage(index);
      Get.back();
    }

    if (MediaQuery.sizeOf(context).width >= 1150) {
      return ListView(
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text('home'),
            onTap: () {
              pageMenuController.changePage(0);
              Get.back();
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('search'),
            onTap: () {
              pageMenuController.changePage(1);
              Get.back();
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('person'),
            onTap: () {
              pageMenuController.changePage(2);
              Get.back();
            },
          ),
        ],
      );
    }
    return Center(
        child: ListView(
      children: [
        IconButton(
            onPressed: () {
              onTap(0);
            },
            icon: Icon(Icons.home)),
        IconButton(
            onPressed: () {
              onTap(1);
            },
            icon: Icon(Icons.search)),
        IconButton(
            onPressed: () {
              onTap(2);
            },
            icon: Icon(Icons.person))
      ],
    ));
  }
}
