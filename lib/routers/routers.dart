import 'package:get/get.dart';
import 'package:svmj_web/views/home_page.dart';
import 'package:svmj_web/views/login_page.dart';
import 'package:svmj_web/views/unknown_page.dart';
import 'package:svmj_web/views/web_main.dart';

class AppPage {

  static final webRoutes=[
    GetPage(
      name: "/",
      page: () => MainWebLayout() ,
      opaque: false,
      // middlewares: [AuthMiddleWare()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/home",
      page: () => MainWebLayout() ,
      // middlewares: [AuthMiddleWare()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/search",
      page: () => MainWebLayout(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/profile",
      page: () => MainWebLayout(),
      // middlewares: [AuthMiddleWare()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/post/:postCode/:replyCode",
      page: () => MainWebLayout(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/mindrealm",
      page: () => MainWebLayout(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/bookmarks",
      page: () => MainWebLayout(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/notifications",
      page: () => MainWebLayout(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/login",
      page: () => LoginPage(),
    ),
  ];

  static final routes = [




    GetPage(
      name: "/",
      page: () => WebHomePage() ,
      // middlewares: [AuthMiddleWare()],
      transition: Transition.noTransition,
    ),

    GetPage(name: '/notfound', page: () => UnknownPage()),
  ];
}
