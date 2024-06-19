import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LanguageController extends GetxController {
  var selectedLanguage = 'en_US'.obs;

  void changeLocale(String langCode, String countryCode) {
    var locale = Locale(langCode, countryCode);
    Get.updateLocale(locale);
    selectedLanguage.value = '${langCode}_${countryCode}';
  }
}
