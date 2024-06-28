import 'package:get/get.dart';

class HomeMenuController extends GetxController {
  var selectedPage = 0.obs;
  //final selectedPageStore = GetStorage('selectedPage');
  var notificationCount = [0, 0, 0, 0, 0, 3, 0].obs;



  void changePage(int index) {
    notificationCount[index] = 0;
    selectedPage.value = index;
    // selectedPageStore.write('pageIndex', index);
    update();
  }

}
