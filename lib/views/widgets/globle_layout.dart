import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/home_menu_controller.dart';
import 'package:svmj_web/views/widgets/border_container.dart';
import 'package:svmj_web/views/widgets/gloable_content_layout.dart';
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
          return buildWebLayout(context);
        },
      ),
      bottomNavigationBar: screenWidth <= 500 ? buildBottomBar(context) : null,
    );
  }

  double getNavigationWidth(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    if (screenWidth >= 1150) {
      return 250;
    } else if (screenWidth > 600) {
      return 70;
    }
    return 0;
  }

  Widget buildWebLayout(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyBorderContainer(widget: buildLeftNavigation(context)),
          MyBorderContainer(widget: buildMainContent(context)),
          buildRightRecommendations(context, screenWidth),
        ],
      ),
    );
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
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0), // 控制距离顶部的距离
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600.0, minWidth: 380),
          child: widget,
        ),
      ),
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
