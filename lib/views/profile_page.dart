import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/views/search_page.dart';
import 'package:svmj_web/views/web_globle_layout.dart';
import 'package:svmj_web/views/widgets/gloable_content_layout.dart';

class  MobileProfilePage extends StatelessWidget {
  // final AnotherController anotherController = Get.put();

  @override
  Widget build(BuildContext context) {
    return GloableContentLayout(
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
    );
  }

  Widget buildSearch(BuildContext context) {
    return Text('${Get.parameters['searchParam']}');
  }
}
class WebProfilePage extends StatelessWidget {
  // final AnotherController anotherController = Get.put();

  @override
  Widget build(BuildContext context) {
    return GlobleWebLayout(widget: MobileSearchPage( )  );
  }
}