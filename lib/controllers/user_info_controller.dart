import 'dart:convert';

import 'package:get/get.dart';
import 'package:svmj_web/api/api.dart';
import 'package:svmj_web/api/dio.dart';
import 'package:svmj_web/controllers/async_controller.dart';
import 'package:svmj_web/models/user_info.dart';

class UserInfoController extends AsyncController {
  var u = UserInfo().obs;
  //var isLoading = true.obs;
  // var hasError = false.obs;
  @override
  void onInit() {
    // getFetchTrends();
    super.onInit();
  }

  Future<void> getUserInfo(String userCode) async {
    try {
      startRequest();

      final response = await makeHttpRequest(
          (Api.profileUserInfo),
          jsonEncode(<String, dynamic>{
            'userCode': userCode,
          }));

      if (response['body'] != null) {
        u.value = UserInfo.fromJson(response['body']);
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
