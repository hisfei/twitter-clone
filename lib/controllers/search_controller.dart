import 'dart:convert';

import 'package:get/get.dart';
import 'package:svmj_web/api/api.dart';
import 'package:svmj_web/api/dio.dart';
import 'package:svmj_web/controllers/async_controller.dart';
import 'package:svmj_web/models/post_item.dart';
import 'package:svmj_web/models/user_info.dart';

class MSearchController extends AsyncController {
  var userInfoList = <UserInfo>[].obs;
  var postList = <PostItem>[].obs;
  var search = ''.obs;
  var userCode = ''.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void setSearchInfo(String msearch) {
    search.value = msearch;
//    userCode.value = muserCode;
  }

  Future<void> loadUserList() async {
    try {
      startRequest();

      final response = await makeHttpRequest(
          (Api.profileUserInfoList),
          jsonEncode({
            'offset': postList.length,
            'limit': 20,
            'userCode': userCode.value,
            'searchParam': search.value
          }));
      if (response['body'].length < 1) {
        setLoadDataNone();
      } else {
        if (response['body'].length < 20) {
          setLoadDataNone();
        }
        for (var item in response['body']) {
          userInfoList.add(UserInfo.fromJson(item));
        }
      }

      endRequest();
    } catch (error) {
       setError('Failed to load trends: $error');
      endRequest();
      throw Exception('Failed to load trends: $error');
    } finally {
      endRequest();
    }
  }

  Future<void> loadPostList() async {
    try {
      startRequest();

      final response = await makeHttpRequest(
        (Api.profileUserInfoList),
        jsonEncode({
          'offset': postList.length,
          'limit': 20,
          'userCode': userCode.value,
          'searchParam': search.value
        }),
      );

      for (var item in response['body']) {
        postList.add(PostItem.fromJson(item));
      }

      endRequest();
    } catch (error) {
      setError('Failed to load trends: $error');
      endRequest();
      throw Exception('Failed to load trends: $error');
    } finally {
      endRequest();
    }
  }
}
