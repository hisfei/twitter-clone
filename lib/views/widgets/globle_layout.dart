import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/home_menu_controller.dart';
import 'package:svmj_web/views/widgets/border_container.dart';
import 'package:svmj_web/views/widgets/left_navigation.dart';
import 'package:svmj_web/views/widgets/trends_view.dart';

class GlobleLayout extends StatelessWidget {
  GlobleLayout({required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(child: buildWebLayout(context));
        },
        //)
      ),
      bottomNavigationBar: screenWidth <= 500 ? buildBottomBar(context) : null,
    );
  }

  double getNavigationWidth(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    if (screenWidth >= 1150) {
      return 190;
    } else if (screenWidth > 600) {
      return 70;
    }
    return 0;
  }

  Widget buildWebLayout(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
        height: 1000,
        child: Center(
            child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildLeftNavigation(context),
            MyBorderContainer(
                widget: buildMainContent(context), location: 'lr'),
            buildRightRecommendations(context, screenWidth),
          ],
        )));
  }

  Widget buildLeftNavigation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0), // 控制距离顶部的距离
      child: Container(
        width: getNavigationWidth(context),
        child: leftNavigation(),
      ),
    );
  }

  Widget buildMainContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0), // 控制距离顶部的距离
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600.0, minWidth: 350),
        child: widget,
      ),
      //),
    );
  }

  Widget buildRightRecommendations(BuildContext context, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0), // 控制距离顶部的距离
      child: SizedBox(
        width: screenWidth >= 970 ? 350 : 0,
        child: screenWidth >= 970 ? TrendsView() : null,
      ),
    );
  }

  Obx buildBottomBar(BuildContext context) {
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
                Get.offAllNamed('/home');
                break;
              case 1:
                Get.offAllNamed('/search');
                break;
              case 2:
                Get.offAllNamed('/profile');
                break;
              default:
                Get.offAllNamed('/home');
            }
          },
        ));
  }
}
