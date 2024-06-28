import 'dart:convert';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/async_controller.dart';
import '../api/api.dart';
import '../api/dio.dart';
import '../models/post_item.dart';

class HomeStreamController extends AsyncController {
  var itemsForYou = <PostItem>[].obs;
  var itemsFollowing = <PostItem>[].obs;
  var isForYouSharedList = <bool>[].obs;
  var isFollowingSharedList = <bool>[].obs;

  void toggleForYouShareAt(int index) {
    isForYouSharedList[index] = !isForYouSharedList[index];
    update();
  }
  void toggleFollowingShareAt(int index) {
    isFollowingSharedList[index] = !isFollowingSharedList[index];
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
    _loadMore(Api.homeLoadMore, itemsFollowing.length, 2);
  }

  Future<void> loadMoreForYou() async {
    _loadMore(Api.homeLoadMore
        , itemsForYou.length, 1);
  }

  Future<void> _loadMore(
    String url,
  int itemsLength,
    int type,
  ) async {
    if (otherPageRefresh.value != true) {
      return;
    }

    startRequest();
    try {
      final response = await makeHttpRequest(
        url,
        jsonEncode({'offset': itemsLength, 'limit': 20, 'type': type}),
      );

      if (type==2){

        for (var item in response['body']) {
          itemsFollowing.add(PostItem.fromJson(item));
          isFollowingSharedList.add(false);
        }
      }else if (type==1){
        for (var item in response['body']) {
          itemsForYou.add(PostItem.fromJson(item));
          isForYouSharedList.add(false);
        }
      }


      endRequest();
    } catch (e) {
      endRequest();
      setError('Error occurred while loading more data: $e');
    } finally {
      endRequest();
      update();
    }
  }
}
