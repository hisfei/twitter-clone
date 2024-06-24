import 'package:get/get.dart';

class HomeMenuController extends GetxController {
  var selectedPage = 0.obs;
  var notificationCount = [-1, 0, 0, 0, 0, 3, 0].obs;
  void changePage(int index) {
    notificationCount[index] = 0;
    selectedPage.value = index;
    update();
  }
}
