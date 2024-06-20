import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/home_menu_controller.dart';

class leftNavigation extends StatelessWidget {
  final HomeMenuController homeMenuController = Get.find();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (MediaQuery.sizeOf(context).width >= 1150) {
          return buildListView(context);
        } else if (MediaQuery.sizeOf(context).width >= 600) {
          return buildCenteredIcons(context);
        } else {
          return Container(); // Return an empty container for smaller widths
        }
      },
    );
  }

  Widget buildListView(BuildContext context) {
    return ListView(
      children: [
        Text('Logo'),
        buildListTile(CupertinoIcons.home, 'home'.tr, 0, 'home'),
        buildListTile(
            CupertinoIcons.bolt_horizontal_circle, 'explore'.tr, 1, 'explore'),
        buildListTile(
            CupertinoIcons.circle_grid_hex, 'mindRealm'.tr, 2, 'mindRealm'),
        buildListTile(CupertinoIcons.bookmark, 'bookmarks'.tr, 3, 'bookmarks'),
        buildListTile(CupertinoIcons.chat_bubble_2, 'message'.tr, 4, 'message'),
        buildListTile(
            CupertinoIcons.bell, 'notifications'.tr, 5, 'notifications'),
        buildListTile(CupertinoIcons.person, 'profile'.tr, 6, 'profile'),
      ],
    );
  }

  Widget buildListTile(
      IconData icon, String title, int index, String routeName) {
    bool isSelected = homeMenuController.selectedPage.value == index;
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      minTileHeight: 60,
      leading: buildIconButton(icon, title, index, routeName),
      //subtitle: Text('sadsad'),
      //trailing: Text('sadsad'),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () => onTap(index, routeName),
    );
  }

  Widget buildCenteredIcons(BuildContext context) {
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildIconButton(CupertinoIcons.home, 'home'.tr, 0, 'home'),
          buildIconButton(CupertinoIcons.bolt_horizontal_circle, 'explore'.tr,
              1, 'explore'),
          buildIconButton(
              CupertinoIcons.circle_grid_hex, 'mindRealm'.tr, 2, 'mindRealm'),
          buildIconButton(
              CupertinoIcons.bookmark, 'bookmarks'.tr, 3, 'bookmarks'),
          buildIconButton(
              CupertinoIcons.chat_bubble_2, 'message'.tr, 4, 'message'),
          buildIconButton(
              CupertinoIcons.bell, 'notifications'.tr, 5, 'notifications'),
          buildIconButton(CupertinoIcons.person, 'profile'.tr, 6, 'profile'),
        ],
      ),
    );
  }

  Widget buildIconButton(
      IconData icon, String title, int index, String routeName) {
    bool isSelected = homeMenuController.selectedPage.value == index;
    return IconButton(
      icon: Icon(icon),
      //iconSize: 40,
      onPressed: () => onTap(index, routeName),
      color: isSelected
          ? Color(0xff279bf0)
          : Colors.black, // Example of changing icon color when selected
    );
  }

  void onTap(int index, String name) {
    homeMenuController.changePage(index);
    Get.toNamed('/$name');
    // If you want to clear the navigation stack when tapping an item:
    // Get.offAllNamed('/$name');
  }
}
