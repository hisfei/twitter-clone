import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/controllers.dart';
import 'package:svmj_web/l10n/translations.dart';
import 'package:svmj_web/routers/routers.dart';
import 'package:svmj_web/themes/light.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:svmj_web/views/unknown_page.dart';

void main() {
  Controllers.init();
  runApp(const MJ());
}

class MJ extends StatelessWidget {
  const MJ({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslations(),
      locale: Locale('zh', 'CN'),
      fallbackLocale: Locale('zh', 'CN'),
      supportedLocales: [
        Locale('zh', 'CN'),
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('fr', 'FR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      enableLog: true,
      navigatorKey: Get.key,
      initialRoute: "/",
      getPages: AppPage.routes,
      unknownRoute: GetPage(name: '/notfound', page: () => UnknownPage()),
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
