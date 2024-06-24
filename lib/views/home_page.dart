import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/views/widgets/gloable_content_layout.dart';
import 'package:svmj_web/views/widgets/globle_layout.dart';
import 'package:svmj_web/views/widgets/home_stream.dart';
import '../controllers/home_stream_controller.dart';

class HomePage extends StatelessWidget {
  final HomeStreamController homeStreamController = Get.find();
  // final AnotherController anotherController = Get.put();

  @override
  Widget build(BuildContext context) {
    return GlobleLayout(
        widget: GloableContentLayout(
      tabs: [
        Tab(text: 'foryou'.tr),
        Tab(text: 'following'.tr),
      ],
      tabViews: [
        buildForYouList(context),
        buildFollowingList(context),
      ],
      onRefreshCallbacks: [
        homeStreamController.refreshForYou,
        homeStreamController.refreshFollowing, // Example for another tab
      ],
    ));
  }

  Widget buildForYouList(context) {
    return Obx(() {
      return MediaQuery.removePadding(
          //removeTop: true,
          context: context,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: homeStreamController.itemsForYou.length + 1,
            itemBuilder: (context, index) {
              if (index == homeStreamController.itemsForYou.length) {
                homeStreamController.loadMoreForYou();

                return Center(child: CircularProgressIndicator());
              }
              return HomeStream(
                item: homeStreamController.itemsForYou[index],
                index: index,
              );
            },
          ));
    });
  }

  Widget buildFollowingList(context) {
    return Obx(() {
      return MediaQuery.removePadding(
          //removeTop: true,
          context: context,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: homeStreamController.itemsFollowing.length + 1,
            itemBuilder: (context, index) {
              if (index == homeStreamController.itemsFollowing.length) {
                homeStreamController.loadMoreFollowing();

                return Center(child: CircularProgressIndicator());
              }
              return HomeStream(
                item: homeStreamController.itemsFollowing[index],
                index: index,
              );
            },
          ));
    });
  }
}
