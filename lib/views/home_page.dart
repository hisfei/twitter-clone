import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:svmj_web/views/web_globle_layout.dart';
import 'package:svmj_web/views/widgets/gloable_content_layout.dart';
import 'package:svmj_web/views/widgets/home_stream.dart';
import '../controllers/home_stream_controller.dart';

class  WebHomePage extends StatelessWidget {
  final HomeStreamController homeStreamController = Get.find();

  @override
  Widget  build(BuildContext context) {

    return  GlobleWebLayout(widget: MobileHomePage( )  );
  }


 }
class  MobileHomePage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeStreamController homeStreamController = Get.find();
   return GloableContentLayout(
     tabs: [
       Tab(text: 'foryou'.tr),
       Tab(text: 'following'.tr),
     ],
     tabViews: [
       buildForYouList( ),
       buildFollowingList( ),
     ],
     onRefreshCallbacks: [
       homeStreamController.refreshForYou,
       homeStreamController.refreshFollowing, // Example for another tab
     ],
   );

  }


}

class buildFollowingList extends StatelessWidget {
// final AnotherController anotherController = Get.put();
  final HomeStreamController homeStreamController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MediaQuery.removePadding(
          //removeTop: true,
          context: context,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: homeStreamController.itemsFollowing.length + 1,
            itemBuilder: (context, index) {
              if (index == homeStreamController.itemsFollowing.length  ) {
                if (!homeStreamController.hasError.value){
                  homeStreamController.loadMoreFollowing();
                  return   const Center(child: CircularProgressIndicator());
                }
                return SizedBox.shrink();

              }
              return HomeStream(
                item: homeStreamController.itemsFollowing[index],
                index: index,
                type: 2,
              );
            },
          ));
    });
  }
}

class buildForYouList extends StatelessWidget {
// final AnotherController anotherController = Get.put();
  final HomeStreamController homeStreamController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MediaQuery.removePadding(
          //removeTop: true,
          context: context,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: homeStreamController.itemsForYou.length + 1,
            itemBuilder: (context, index) {
              if (index == homeStreamController.itemsForYou.length) {
                if (!homeStreamController.hasError.value) {
                  homeStreamController.loadMoreForYou();

                  return const Center(child: CircularProgressIndicator());
                }  return SizedBox.shrink();


              }
              return HomeStream(
                item: homeStreamController.itemsForYou[index],
                index: index,
                type: 1,
              );
            },
          ));
    });
  }
}
