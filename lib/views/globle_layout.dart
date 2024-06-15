import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/home_menu_controller.dart';
import 'package:svmj_web/views/recommendations_page.dart';
import 'package:svmj_web/views/widgets/left_navigation.dart';

class GlobleLayout extends StatelessWidget {
  GlobleLayout({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return webLayout(context);
        },
      ),
      bottomNavigationBar: screenWidth <= 500 ? bottomBar(context) : null,
    );
  }

  double getwidth(context) {
    if (MediaQuery.sizeOf(context).width >= 1150) {
      return 250;
    } else if (MediaQuery.sizeOf(context).width > 600) {
      return 70;
    }
    return 0;
  }

  Widget webLayout(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: getwidth(context),
            child: leftNavigation(),
          ),
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600.0, minWidth: 380),
              child: Container(child: widget),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: screenWidth >= 970 ? 300 : 0,
            child: screenWidth >= 970 ? Recommendations() : null,
          ),
        ],
      ),
    );
  }

  Obx bottomBar(BuildContext context) {
    final HomeMenuController homeMenuController = Get.find();

    return Obx(() => BottomNavigationBar(
          currentIndex: homeMenuController.selectedPage.value,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          onTap: (index) {
            homeMenuController.changePage(index);
            switch (index) {
              case 0:
                Get.toNamed('/home');
                break;
              case 1:
                Get.toNamed('/search');

                ///.offNamedUntil('/search', (route) => false, id: 2);
                break;
              case 2:
                Get.toNamed('/profile');

                break;
              default:
                Get.toNamed('/home');
            }
          },
        ));
  }
}
