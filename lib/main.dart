import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/controllers.dart';
import 'package:svmj_web/routers/routers.dart';
import 'package:svmj_web/themes/light.dart';

import 'package:svmj_web/views/responsive_layout.dart';

void main() {
  Controllers.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: AppPage.routes,

      home: ResponsiveLayout(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lighThemeData,

      // onGenerateRoute: onGenerateRoute,
      defaultTransition: Transition.rightToLeft,
    );
  }
}
