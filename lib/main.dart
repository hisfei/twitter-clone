import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/controllers.dart';
import 'package:svmj_web/routers/routers.dart';
import 'package:svmj_web/themes/light.dart';
import 'package:svmj_web/views/home_page.dart';
import 'package:svmj_web/views/login_page.dart';
import 'package:svmj_web/views/post_content_page.dart';
import 'package:svmj_web/views/profile_page.dart';
import 'package:svmj_web/views/search_page.dart';

void main() {
  Controllers.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      navigatorKey: Get.key,
      initialRoute: "/",
      getPages: AppPage.routes,
      unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
      /*  routingCallback: (routing) {
        print('Current Route: ${routing?.current}');
        print('Previous Route: ${routing?.previous}');
      }, */
      //home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lighThemeData,
      defaultTransition: Transition.rightToLeft,
    );
  }
}

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('UnknownRoutePage');
    print(Get.currentRoute);
    return Scaffold(
      appBar: AppBar(
        title: Text('Unknown Route'),
      ),
      body: Center(
        child: Text('404 - Page Not Found'),
      ),
    );
  }
}
