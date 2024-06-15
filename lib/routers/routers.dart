import 'package:get/get.dart';
import 'package:svmj_web/middlewares/auth_middleware.dart';
import 'package:svmj_web/views/home_page.dart';
import 'package:svmj_web/views/login_page.dart';
import 'package:svmj_web/views/post_content_page.dart';
import 'package:svmj_web/views/profile_page.dart';
import 'package:svmj_web/views/search_page.dart';

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
      name: "/content/:postCode/:replyCode",
      page: () => PostContentPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: "/login",
      page: () => LoginPage(),
    ),
  ];
}
