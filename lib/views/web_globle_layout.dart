import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/home_menu_controller.dart';
import 'package:svmj_web/themes/light.dart';
import 'package:svmj_web/views/widgets/border_container.dart';
import 'package:svmj_web/views/widgets/left_navigation.dart';
import 'package:svmj_web/views/widgets/trends_view.dart';

class GlobleWebLayout extends StatelessWidget {
  GlobleWebLayout({required this.widget });
   final Widget widget;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context , constraints) {
          return SingleChildScrollView(child: buildWebLayout(context ));
        },
      ),
      bottomNavigationBar: screenWidth <= 600 ? buildBottomBar(context) : null,
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
    final screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
        height: 1000,
        child: Center(
            child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildLeftNavigation(context),
            Flexible(
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints(maxWidth: 600.0, minWidth: 380),
                child: Container(
                    child: MyBorderContainer(
                        widget: buildMainContent(context), location: 'lr')),
              ),
            ),
            //MyBorderContainer(widget: buildMainContent(context), location: 'lr'),
            buildRightRecommendations(context, screenWidth),
          ],
        )));
  }

  Widget buildLeftNavigation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0), // 控制距离顶部的距离
      child: SizedBox(
        width: getNavigationWidth(context),
        child: LeftNavigation(),
      ),
    );
  }

  Widget buildMainContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0), // 控制距离顶部的距离
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600.0, minWidth: 350),
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
        child: screenWidth >= 970 ? const TrendsView() : null,
      ),
    );
  }

  Obx buildBottomBar(BuildContext context) {
    final HomeMenuController homeMenuController = Get.find();

    return Obx(() => BottomNavigationBar(
          currentIndex: homeMenuController.selectedPage.value,
          items: [
            BottomNavigationBarItem(
                backgroundColor: MyColor.white,
                icon: Material(
                  color: Colors
                      .transparent, // Set color to transparent to remove tap effect
                  child: Icon(
                    CupertinoIcons.home,
                  ),
                ),
                label: 'Home'),
            const BottomNavigationBarItem(
                icon: Material(
                    color: Colors.transparent,
                    child: Icon(CupertinoIcons.search)),
                label: 'Search'),
            const BottomNavigationBarItem(
                icon:  Material(
                color: Colors.transparent,
                child: Icon(CupertinoIcons.circle_grid_hex))  , label: 'MindRealm'),
            const BottomNavigationBarItem(
                icon: Material(
                    color: Colors.transparent,
                    child: Icon(CupertinoIcons.chat_bubble_2)), label: 'message'),
            const BottomNavigationBarItem(
                icon:Material(
                    color: Colors.transparent,
                    child:  Icon(CupertinoIcons.bell)), label: 'notifications'),
          ],
          onTap: (index) {
            homeMenuController.changePage(index);
          /*  switch (index) {
              case 0:
                Get.offAllNamed('/home');
                break;
              case 1:
                Get.offAllNamed('/search');
                break;
              case 2:
                Get.offAllNamed('/mindrealm');
                break;
              case 3:
                Get.offAllNamed('/message');
                break;
              case 4:
                Get.offAllNamed('/notifications');
                break;
              default:
                Get.offAllNamed('/home');
            }*/
          },
        ));
  }
}
