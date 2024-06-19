import 'package:get/get.dart';
import 'home_controller.dart';
import 'home_menu_controller.dart';
import 'trends_controller.dart';

class Controllers {
  static void init() {
    Get.put(HomeDataController(), permanent: true);
    Get.put(HomeMenuController(), permanent: true);
    Get.put(TrendsController(), permanent: true);
  }
}
