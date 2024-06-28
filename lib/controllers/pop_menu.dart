import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopMenuController extends GetxController {
  OverlayEntry? _overlayEntry;

  var overlayContent = Rx<Widget>(Container()); // 使用 Rx<Widget?> 来存储 Widget

  // 这里可以添加一些逻辑来更新 overlayContent
  void updateOverlayContent(Widget newWidget) {
    overlayContent.value = newWidget;
  }

  void showOverlay(BuildContext context) {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry(context);
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  void hideOverlay(int delayed) {
    Future.delayed(Duration(milliseconds: delayed), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
     return OverlayEntry(
      builder: (context) => Stack(
        fit: StackFit.expand,
        children: [
          // Barrier to disable interactions with other parts of the page

          Positioned.fill(
              child: GestureDetector(
            onTap: () => hideOverlay(0),
            child: Container(
              color: Colors.transparent, // Semi-transparent color
            ),
          )),

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
}
