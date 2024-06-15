import 'package:get/get.dart';
import 'package:svmj_web/controllers/storage.dart';

class PostContentDataController extends GetxController {
 
  Store store = Get.find();
  var postCode = 0.obs;
  var replyCode = 0.obs;
  

  @override
  void onInit() {
    if (postCode == 0) {
      postCode.value = store.postContentDataRequest.value.read('postCode') ?? 0;
      replyCode.value =
          store.postContentDataRequest.value.read('replyCode') ?? 0;
    }

    super.onInit();

    //refreshData();
  }

  void syncPageRequest(int postCodce, int replyCocde) {
    postCode.value = postCodce;
    replyCode.value = replyCocde;
    store.postContentDataRequest.value.write('postCode', postCodce);
    store.postContentDataRequest.value.write('replyCode', replyCocde);
  }
  
} 