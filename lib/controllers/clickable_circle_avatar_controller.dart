import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/api/api.dart';
import 'package:svmj_web/api/dio.dart';
import 'package:svmj_web/controllers/async_controller.dart';

import '../models/user_info.dart';
import 'gc.dart';


class ClickableCircleAvatarController extends AsyncController {
  OverlayEntry? _overlayEntry;
  //var _isMouseOver = false.obs;
  var u = UserInfo().obs;

  var overlayContent = Rx<Widget>(Container()); // 使用 Rx<Widget?> 来存储 Widget
   Timer? hoverTimer; // 用来跟踪停留时间的 Timer

  final hoverDuration = Duration(milliseconds: 800); // 设定停留时间为2秒



  void stopHoverTimer() {
    hoverTimer?.cancel(); // 鼠标离开时取消 Timer
  }
  // 这里可以添加一些逻辑来更新 overlayContent
  void updateOverlayContent(Widget newWidget) {
    overlayContent.value = newWidget;
  }
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
  void showOverlay(BuildContext contextc,String userCode) {
    hoverTimer?.cancel(); // 取消之前的 Timer
    hoverTimer = Timer(hoverDuration, () {
      if (_overlayEntry == null) {
        GC gc=Get.find( );
        getUserInfo(userCode);
        _overlayEntry = _createOverlayEntry(contextc);
        Overlay.of(gc.getContext()).insert(_overlayEntry!);
      }

      print("Mouse hovered !");
     });
   // _isMouseOver.value = true;

  }

  void cancalTimer(){
    print("Cancal Mouse hovered !");

    hoverTimer?.cancel(); // 取消之前的 Timer

  }

  void hideOverlay(int delayed) {
    //_isMouseOver.value = false;
    hoverTimer?.cancel(); // 取消之前的 Timer

    Future.delayed(Duration(milliseconds: delayed), () {
     // if (!_isMouseOver.value) {
        _overlayEntry?.remove();
        _overlayEntry = null;
     // }
    });
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context ) => Stack(

        children: [
          // Barrier to disable interactions with other parts of the page

          //onEnter: (_) => showOverlay(context),
          Positioned.fill(
            child: GestureDetector(
              onTap: () => hideOverlay(0),
              child: Container(
                color: Colors.grey, // Semi-transparent color
              ),
            ),
          ),
          Positioned(
          left: offset.dx,
            top: offset.dy + size.height + 5,
            child: Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular(8),
              child: Obx(() => overlayContent.value),
            ),
          ),
        ],
      ),
    );
  }

  /*  OverlayEntry _createOverlayEntry2(BuildContext context) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 5,
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(8),
          child: MouseRegion(
            onExit: (_) => hideOverlay(0),
            child:
                Obx(() => overlayContent.value), // 使用 Obx 监听 overlayContent 的变化
          ),
        ),
      ),
    );
  } */
}
