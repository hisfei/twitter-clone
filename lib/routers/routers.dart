import 'package:get/get.dart';
 import 'package:svmj_web/views/home_page.dart';
import 'package:svmj_web/views/login_page.dart';
import 'package:svmj_web/views/post_content_page.dart';
import 'package:svmj_web/views/profile_page.dart';
import 'package:svmj_web/views/search_page.dart';
import 'package:svmj_web/views/unknown_page.dart';

class AppPage {
  static final routes = [
    GetPage(
      name: "/",
      page: () => HomePage(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/home",
      page: () => HomePage(),
      //middlewares: [AuthMiddleWare()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/search/:searchParam",
      page: () => SearchPage(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/search",
      page: () => SearchPage(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/profile",
      page: () => ProfilePage(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/post/:postCode/:replyCode",
      page: () => PostContentPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/login",
      page: () => LoginPage(),
    ),
    GetPage(name: '/notfound', page: () => UnknownPage()),
  ];
}
