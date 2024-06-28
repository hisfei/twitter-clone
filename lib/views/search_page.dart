import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/home_menu_controller.dart';
import 'package:svmj_web/controllers/search_controller.dart';
import 'package:svmj_web/views/web_globle_layout.dart';
import 'package:svmj_web/views/widgets/gloable_content_layout.dart';
import 'package:svmj_web/views/widgets/profile_card.dart';
import 'package:svmj_web/views/widgets/search.dart';
import 'package:svmj_web/views/widgets/user_list.dart';
class WebSearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return    GlobleWebLayout(widget: MobileSearchPage( ) )  ;

  }
}
class MobileSearchPage extends StatelessWidget {
  final MSearchController mscontroller = Get.find();
  final HomeMenuController controller = Get.find();

    MobileSearchPage(  );
  @override
  Widget build(context) {
    controller.selectedPage(1);
    return GloableContentLayout(
      tabs: [
        Tab(text: 'user'.tr),
        Tab(text: 'postall'.tr),
        //Tab(text: 'mindRealm'.tr),
        // Tab(text: 'following'.tr),
      ],
      tabViews: [
        buildUserList(),
        buildUserList(),
        //buildFollowingList(context),
      ],
      onRefreshCallbacks: [
        mscontroller.loadUserList,
        mscontroller.loadPostList
      ],
    );
  }
}

class buildUserList extends StatelessWidget {
// final AnotherController anotherController = Get.put();
  final MSearchController mscontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MediaQuery.removePadding(
          //removeTop: true,
          context: context,
          child: Column(children: [
            // Add the search widget here
            Search(),
            Expanded(
                child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: mscontroller.userInfoList.length + 1,
              itemBuilder: (context, index) {
                if (index == mscontroller.userInfoList.length) {
                  if (mscontroller.loadDataNone.value) {
                    return const Text("No more data");
                  } else {
                    mscontroller.loadUserList();
                    return const Center(child: CircularProgressIndicator());
                  }
                }
                if (index < mscontroller.userInfoList.length) {
                  return UserListPage(
                    profile: mscontroller.userInfoList[index],
                    radius: 20,
                    index: index,
                    overlayContent: ProfileCard(
                       ),
                  );
                }
                return const SizedBox.shrink();
              },
            ))
          ]));
    });
  }
}
