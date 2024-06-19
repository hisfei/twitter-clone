import 'dart:convert';
import 'package:get/get.dart';
import '../api/api.dart';
import '../api/dio.dart';
import '../api/status.dart';
import '../models/post_item.dart';

class HomeDataController extends GetxController {
  var itemsForYou = <PostItem>[].obs;
  var itemsFollowing = <PostItem>[].obs;
  var isLoadingMore = false.obs;
  var loadingStatus = LoadingStatus.loading.obs;
  var errorMessage = ''.obs;
  var isForYouSharedList = <bool>[].obs;
  var isFollowingSharedList = <bool>[].obs;

  void toggleShareAt(int index) {
    isForYouSharedList[index] = !isForYouSharedList[index];
    update();
  }

  Future<void> refreshForYou() async {
    itemsForYou.clear();
    isForYouSharedList.clear();
    await loadMoreForYou();
  }

  Future<void> refreshFollowing() async {
    itemsFollowing.clear();
    isFollowingSharedList.clear();
    await loadMoreFollowing();
  }

  Future<void> loadMoreFollowing() async {
    _loadMore(Api.HOME_LOAD_MORE, itemsFollowing, isFollowingSharedList, 1);
  }

  Future<void> loadMoreForYou() async {
    _loadMore(Api.HOME_LOAD_MORE, itemsForYou, isForYouSharedList, 2);
  }

  Future<void> _loadMore(
    String url,
    RxList<PostItem> items,
    RxList<bool> sharedList,
    int type,
  ) async {
    isLoadingMore.value = true;
    loadingStatus.value = LoadingStatus.loading;
    try {
      final response = await makeHttpRequest(
        url,
        jsonEncode({'offset': items.length, 'limit': 20, 'type': type}),
      );

      for (var item in response['body']) {
        items.add(PostItem.fromJson(item));
        sharedList.add(false);
      }
      loadingStatus.value = LoadingStatus.success;
    } catch (e) {
      loadingStatus.value = LoadingStatus.error;
      errorMessage.value = 'Error occurred while loading more data: $e';
    } finally {
      isLoadingMore.value = false;
      update();
    }
  }
}
