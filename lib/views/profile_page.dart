import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/views/widgets/gloable_content_layout.dart';
import 'package:svmj_web/views/widgets/globle_layout.dart';

class ProfilePage extends StatelessWidget {
  // final AnotherController anotherController = Get.put();

  @override
  Widget build(BuildContext context) {
    return GlobleLayout(
        widget: GloableContentLayout(
      tabs: [
        Tab(text: 'foryou'.tr),
        // Tab(text: 'following'.tr),
      ],
      tabViews: [
        buildSearch(context),
        //buildFollowingList(context),
      ],
      onRefreshCallbacks: [
        //homeStreamController.refreshForYou,
        //homeStreamController.refreshFollowing, // Example for another tab
      ],
    ));
  }

  Widget buildSearch(BuildContext context) {
    return Text('${Get.parameters['searchParam']}');
  }
}
