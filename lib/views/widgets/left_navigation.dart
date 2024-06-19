import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/home_menu_controller.dart';

class leftNavigation extends StatelessWidget {
  final HomeMenuController homeMenuController = Get.find();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (MediaQuery.of(context).size.width >= 1150) {
          return buildListView(context);
        } else if (MediaQuery.of(context).size.width >= 600) {
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
        buildListTile(Icons.home, 'Home', 0, 'home'),
        buildListTile(Icons.search, 'Search', 1, 'search'),
        buildListTile(Icons.person, 'Profile', 2, 'profile'),
      ],
    );
  }

  Widget buildListTile(
      IconData icon, String title, int index, String routeName) {
    bool isSelected = homeMenuController.selectedPage.value == index;
    return ListTile(
      leading: buildIconButton(icon, title, index, routeName),
      title: Text(
        title,
        style: TextStyle(
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
          buildIconButton(Icons.home, 'Home', 0, 'home'),
          buildIconButton(Icons.search, 'Search', 1, 'search'),
          buildIconButton(Icons.person, 'Profile', 2, 'profile'),
        ],
      ),
    );
  }

  Widget buildIconButton(
      IconData icon, String title, int index, String routeName) {
    bool isSelected = homeMenuController.selectedPage.value == index;
    return IconButton(
      icon: Icon(icon),
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
