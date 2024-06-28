import 'package:get/get.dart';
import 'package:svmj_web/controllers/clickable_circle_avatar_controller.dart';
import 'package:svmj_web/controllers/login_user_info.dart';
import 'package:svmj_web/controllers/search_controller.dart';
import 'package:svmj_web/controllers/user_info_controller.dart';
 import 'home_stream_controller.dart';
import 'home_menu_controller.dart';
import 'trends_controller.dart';

/* class Controllers {
  static void init() {
    Get.put(HomeStreamController(), permanent: true);
    Get.put(HomeMenuController(), permanent: true);
    Get.put(TrendsController(), permanent: true);
  }
} */

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeStreamController(), permanent: true);
    Get.put(HomeMenuController(), permanent: true);
    Get.put(TrendsController(), permanent: true);
    Get.put(LoginInfoController(), permanent: true);


    //// TODO: implement dependencies
    Get.lazyPut(() => ClickableCircleAvatarController(), fenix: true);
    //Get.lazyPut(() => HomeMenuController(), fenix: true);
    //Get.lazyPut(() => TrendsController(), fenix: true);
    Get.lazyPut(() => UserInfoController(), fenix: true);
    Get.lazyPut(() => MSearchController(), fenix: true);
  }
}
