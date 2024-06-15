import 'package:get/get.dart';

class HomeMenuController extends GetxController {
  var selectedPage = 0.obs;
  void changePage(int index) {
    selectedPage.value = index;
    update();
  }
}
