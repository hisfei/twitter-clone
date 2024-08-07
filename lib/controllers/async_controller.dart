import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AsyncController extends GetxController {
  //var isLoading = true.obs;
  var loadingStat = 0.obs; //0 未开始 1 正在加载 2 加载结束
  var hasError = false.obs;
  var errorMessage = ''.obs;
  var otherPageRefresh = true.obs;
  var loadDataNone = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void startRequest() {
    loadingStat.value = 1;
  }

  void endRequest() {
    loadingStat.value = 2;
  }

  void setError(String message) {
    hasError.value = true;
    errorMessage.value = message;

    loadingStat.value = 2;
    Get.snackbar('Error', '请求失败，请检查网络连接',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 2));

  }

  void setLoadDataNone() {
    loadDataNone.value = true;
  }

  void disableOutherPageRefresh() {
    otherPageRefresh.value = false;
  }

  void ableOutherPageRefresh() {
    otherPageRefresh.value = true;
  }
}
