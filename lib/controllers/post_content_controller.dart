import 'package:get/get.dart';

class PostContentDataController extends GetxController {
  var postCode = 0.obs;
  var replyCode = 0.obs;

  @override
  void onInit() {
    super.onInit();

    //refreshData();
  }

  void syncPageRequest(int postCodce, int replyCocde) {
    postCode.value = postCodce;
    replyCode.value = replyCocde;
  }
}
