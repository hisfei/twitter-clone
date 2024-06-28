import 'package:flutter/cupertino.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/home_menu_controller.dart';
import 'package:svmj_web/controllers/home_stream_controller.dart';
import 'package:svmj_web/controllers/search_controller.dart';
 import 'package:svmj_web/themes/light.dart';
import 'package:svmj_web/views/post_content_page.dart';
import 'package:svmj_web/views/profile_page.dart';
import 'package:svmj_web/views/search_page.dart';
import 'package:svmj_web/views/widgets/border_container.dart';
import 'package:svmj_web/views/widgets/left_navigation.dart';
import 'package:svmj_web/views/widgets/trends_view.dart';

import 'home_page.dart';

class MainMobilePage extends StatelessWidget {
  final HomeMenuController controller = Get.find();
  final HomeStreamController homeStreamController = Get.find();
  final MSearchController mscontroller = Get.find();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(child: buildLayout(context));
        },
      ),
      bottomNavigationBar:   buildBottomBar(context),
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

  Widget buildLayout(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
        height: 1000,
        child: Center(
            child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         buildLeftNavigation(context) ,
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

  Widget mobileLayout(BuildContext context) {
    Widget page = SizedBox.shrink();
    return Navigator(
      key: Get.nestedKey(2),
       onGenerateRoute: (settings) {
        if (settings.name == '/') {
          print(settings.name);
          page = Obx(() {
            switch (controller.selectedPage.value) {
              case 0:
                return MobileHomePage();
              case 1:
                return  MobileSearchPage( );
              case 2:
                return  MobileProfilePage();
              default:
                return MobileHomePage();
            }
          });
        } else if (settings.name != null && settings.name!.contains('/post')) {
          var postParam = settings.name?.replaceAll('/post/', '').split('/');
          if (postParam!.length == 1) {
            page = PostContentPageBase(postCode: postParam[0], replyCode: '0');
          }
          if (postParam.length >= 2) {
            page = PostContentPageBase(
                postCode: postParam[0], replyCode: postParam[1]);
          }
        }

        /*    default:
            print(settings.name);
            page = HomePage();*/

        return GetPageRoute(
          page: () => page,
          settings: settings,
        );
      },
    );
  }

  Widget buildMainContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0), // 控制距离顶部的距离
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600.0, minWidth: 350),
        child: mobileLayout(context),
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
          enableFeedback: false,
          items: [
            BottomNavigationBarItem(
                backgroundColor: MyColor.white,
                icon: const Icon(
                  CupertinoIcons.home,
                ),
                label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search), label: 'Search'),
            const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.circle_grid_hex), label: 'MindRealm'),
            const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_2), label: 'message'),
            const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bell), label: 'notifications'),
          ],
          onTap: (index) {
            //  print(Get.context );
            homeMenuController.changePage(index);
            switch (index) {
              case 0:
                //  GetPlatform.isWeb?Get.offNamedUntil('/', (route) => false, id: 2,transition: Transition.noTransition):null;
                //  GetPlatform.isWeb?  Get.until((route) => Get.currentRoute == '/home'):null;
                /* GetPlatform.isWeb?Get.offUntil( GetPageRoute(
                  page: () => MainPage(),
                  transition: Transition.noTransition,
                ),(route) => false,id:2):null;*/
                Get.back( );

                break;
              case 1:
                Get.offNamedUntil('/', (route) => false );

                ///.offNamedUntil('/search', (route) => false, id: 2);
                break;
              case 2:
                Get.offNamedUntil('/', (route) => false );
              case 3:
                Get.offNamedUntil('/', (route) => false );
              case 4:
                Get.offNamedUntil('/', (route) => false );

                break;
              default:
                Get.offNamedUntil('/', (route) => false );
            }
          },
        ));
  }
}
