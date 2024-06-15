import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/home_menu_controller.dart';
import 'package:svmj_web/views/home_page.dart';
import 'package:svmj_web/views/post_content_page.dart';
import 'package:svmj_web/views/recommendations_page.dart';
import 'package:svmj_web/views/widgets/web_navigation.dart';
import 'package:svmj_web/views/search_page.dart';
import 'package:svmj_web/views/profile_page.dart';

class ResponsiveLayout extends StatelessWidget {
  final HomeMenuController homeMenuController = Get.find();

  ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (screenWidth > 500) {
            return webLayout(context);
          } else {
            return mobileLayout(context);
          }
        },
      ),
      bottomNavigationBar: screenWidth <= 500 ? bottomBar(context) : null,
    );
  }

  Widget webLayout(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: screenWidth >= 1150 ? 250 : 70,
            child: Navigation(),
          ),
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600.0, minWidth: 430),
              child: Navigator(
                key: Get.nestedKey(1),
                onGenerateRoute: (settings) {
                  Widget page;
                  switch (settings.name) {
                    case '/':
                      page = HomePage();
                      break;
                    case '/postContent':
                      page = PostContentPage();
                      break;
                    case '/search':
                      page = SearchPage();
                      break;
                    case '/profile':
                      page = ProfilePage();
                      break;
                    default:
                      page = HomePage();
                  }
                  return GetPageRoute(
                    page: () => page,
                    settings: settings,
                  );
                },
              ),
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

  Widget mobileLayout(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(2),
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/':
            page = Obx(() {
              switch (homeMenuController.selectedPage.value) {
                case 0:
                  return HomePage();
                case 1:
                  return SearchPage();
                case 2:
                  return ProfilePage();
                default:
                  return HomePage();
              }
            });
            break;
          case '/postContent':
            page = PostContentPage();
            break;
          default:
            page = HomePage();
        }
        return GetPageRoute(
          page: () => page,
          settings: settings,
        );
      },
    );
  }

  Obx bottomBar(BuildContext context) {
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
                Get.offNamedUntil('/', (route) => false, id: 2);
                break;
              case 1:
                Get.offUntil(GetPageRoute(page: () => SearchPage()),
                    (route) => route.settings.name == '/home',
                    id: 2);

                ///.offNamedUntil('/search', (route) => false, id: 2);
                break;
              case 2:
                Get.offUntil(GetPageRoute(page: () => ProfilePage()),
                    (route) => route.settings.name == '/ProfilePage',
                    id: 2);
                break;
              default:
                Get.offNamedUntil('/', (route) => false, id: 2);
            }
          },
        ));
  }
}
