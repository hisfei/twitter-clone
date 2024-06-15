import 'package:get/get.dart';
import 'package:svmj_web/controllers/home_controller.dart';
import 'package:svmj_web/controllers/home_menu_controller.dart';
import 'package:svmj_web/controllers/post_content_controller.dart';
import 'package:svmj_web/controllers/storage.dart';

class Controllers {
  static void init() {
    Get.put(HomeDataController(), permanent: true);
    Get.put(HomeMenuController(), permanent: true);
    Get.put(Store(), permanent: true);

    // Get.put(PostContentDataController(), permanent: true);
    Get.put(PostContentDataController(), permanent: true);

    //Get.lazyPut<PostContentDataController>(() => PostContentDataController(),
    //  fenix: true);
    // 在这里添加其他需要实例化的控制器
  }
}
