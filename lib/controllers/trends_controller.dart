import 'dart:convert';

import 'package:get/get.dart';
import 'package:svmj_web/api/api.dart';
import 'package:svmj_web/api/dio.dart';
import 'package:svmj_web/models/trend_for_you.dart';

class TrendsController extends GetxController {
  var trends = <Trend>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    getFetchTrends();
    super.onInit();
  }

  void getFetchTrends() async {
    try {
      isLoading(true);

      final response = await makeHttpRequest(
          (Api.homeTrends),
          jsonEncode(<String, dynamic>{
            'userCode': 'items.length',
          }));

      for (var item in response['body']) {
        trends.add(Trend.fromJson(item));
      }
    } catch (error) {
      print(error);
      throw Exception('Failed to load trends: $error');
    } finally {
      isLoading(false);
    }
  }
}
