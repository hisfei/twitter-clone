import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/search_controller.dart';
import 'package:svmj_web/views/widgets/gloable_content_layout.dart';
import 'package:svmj_web/views/widgets/globle_layout.dart';
import 'package:svmj_web/views/widgets/profile_card.dart';
import 'package:svmj_web/views/widgets/user_list.dart';

class SearchPage extends StatelessWidget {
  // final AnotherController anotherController = Get.put();
  final MSearchController mscontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    String param = Get.parameters['searchParam'] ?? '';
    mscontroller.setSearchInfo(param);
    return GlobleLayout(
        widget: GloableContentLayout(
      tabs: [
        Tab(text: 'user'.tr),
        Tab(text: 'postall'.tr),
        //Tab(text: 'mindRealm'.tr),
        // Tab(text: 'following'.tr),
      ],
      tabViews: [
        buildUserListPage(context),
        buildSearch(context),
        //buildFollowingList(context),
      ],
      onRefreshCallbacks: [
        mscontroller.loadUserList,
        mscontroller.loadPostList
      ],
    ));
  }

  Widget buildUserListPage(context) {
    return Obx(() {
      return MediaQuery.removePadding(
          //removeTop: true,
          context: context,
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
                      userCode: mscontroller.userInfoList[index].userCode),
                );
              }
              return const SizedBox.shrink();
            },
          ));
    });
  }

  Widget buildSearch(BuildContext context) {
    return Text('${Get.parameters['searchParam']}');
  }
}
