import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverlayController extends GetxController {
  Rx<OverlayEntry?> overlayEntry = Rx<OverlayEntry?>(null);

  void showOverlay(OverlayEntry entry, OverlayEntry createOverlayEntry) {
    hideOverlay(); // 先隐藏之前的 overlay
    overlayEntry.value = entry;
    Overlay.of(Get.context!)?.insert(entry);
  }

  void hideOverlay() {
    overlayEntry.value?.remove();
    overlayEntry.value = null;
  }
}
