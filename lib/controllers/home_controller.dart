import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:svmj_web/api/api.dart';
import 'package:svmj_web/api/dio.dart';
import 'package:svmj_web/api/status.dart';
import 'dart:convert';
import 'package:svmj_web/models/post_item.dart';
import 'package:dio/dio.dart';

class HomeDataController extends GetxController {
  var items = <PostItem>[].obs;
  var isLoadingMore = false.obs;
  var loadingStatus = LoadingStatus.loading.obs;
  var errorMessage = ''.obs;
  final dio = Dio();
  var isSharedList = <bool>[].obs;

  void toggleShareAt(int index) {
    // 切换指定索引的分享状态
    isSharedList[index] = !isSharedList[index];
    update(); // 通知GetX状态已更改
  }

  @override
  void onInit() {
    super.onInit();
    //refreshData();
  }

  Future<void> refreshData() async {
    items.clear();
    isSharedList.clear();

    await loadMore();
  }

  Future<void> loadMore() async {
    isLoadingMore.value = true;
    loadingStatus.value = LoadingStatus.loading;
    try {
      final response = await makeHttpRequest(
        (Api.HOME_LoadMore),
        jsonEncode(<String, dynamic>{
          'offset': items.length,
          'limit': 20,
        }),
      );

      for (var item in response['body']) {
        items.add(PostItem.fromJson(item));
        isSharedList.add(false);
      }
      loadingStatus.value = LoadingStatus.success;
    } catch (e) {
      loadingStatus.value = LoadingStatus.error;
      errorMessage.value = 'Error occurred while loading more data: $e';
      if (kDebugMode) {
        print(errorMessage);
      }
    } finally {
      isLoadingMore.value = false;
      update();
    }
  }

/* 
  Future<void> loadMore() async {
    //if (isLoadingMore.value) return;
    isLoadingMore.value = true;
    loadingStatus.value = LoadingStatus.loading;
    try {
      final response = await makeHttpRequest(
        (Api.HOME_LoadMore),
        jsonEncode(<String, dynamic>{
          'offset': items.length,
          'limit': 20,
        }),
      );

      for (int i = 0; i < response['body'].length; i++) {
        items.add(PostItem.fromJson(response['body'][i]));
        isSharedList.add(false);
      }

      //items.addAll(newItems);
      loadingStatus.value = LoadingStatus.success;
    } catch (e) {
      loadingStatus.value = LoadingStatus.error;
      errorMessage.value = 'Error occurred while loading more data: $e';
      if (kDebugMode) {
        print(errorMessage);
      }
    }

    //isLoadingMore.value = false;
    update();
  } */
}
