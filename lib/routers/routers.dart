import 'package:get/get.dart';
import 'package:svmj_web/middlewares/auth_middleware.dart';
import 'package:svmj_web/views/login_page.dart';
import 'package:svmj_web/views/post_content_page.dart';
import 'package:svmj_web/views/profile_page.dart';
import 'package:svmj_web/views/responsive_layout.dart';

class AppPage {
  static final routes = [
    GetPage(
      name: "/",
      page: () => ResponsiveLayout(),
      // middlewares: [AuthMiddleWare()],
    ),
    GetPage(
      name: "/profilePage",
      page: () => ProfilePage(),
      // middlewares: [AuthMiddleWare()],
    ),
    GetPage(
      name: "/postContent",
      page: () => PostContentPage(),
      // middlewares: [AuthMiddleWare()],
    ),
    GetPage(
      name: "/login",
      page: () => LoginPage(),
    ),
  ];
  static final webRoutes = [
    GetPage(
      name: "/",
      page: () => ResponsiveLayout(),
      // middlewares: [AuthMiddleWare()],
    ),
    GetPage(
      name: "/profilePage",
      page: () => ProfilePage(),
      // middlewares: [AuthMiddleWare()],
    ),
    GetPage(
      name: "/postContent",
      page: () => PostContentPage(),
      // middlewares: [AuthMiddleWare()],
    ),
    GetPage(
      name: "/login",
      page: () => LoginPage(),
    ),
  ];
}
