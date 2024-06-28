import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/async_controller.dart';

class AsyncPage<T> extends StatelessWidget {
  final AsyncController controller;
  final Widget Function() builder;

  AsyncPage({
    required this.controller,
    required this.builder,
  });
  /* var loadingStat = 0.obs; //0 未开始 1 正在加载 2 加载结束
  var hasError = false.obs;
  var errorMessage = ''.obs; */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Obx(() {
          if (controller.loadingStat.value == 1) {

            return const CircularProgressIndicator();
          } else if (controller.hasError.value) {
            return Text('加载数据时出错: ${controller.errorMessage}');
          } else if (controller.loadingStat.value == 2 &&
              controller.hasError.value == false) {
            return builder();
          } else {
            return const Text('没有数据');
          }
        }),
      ),
    );
  }
}
