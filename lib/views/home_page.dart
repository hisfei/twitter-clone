import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/api/api.dart';
import 'package:svmj_web/api/dio.dart';
import 'package:svmj_web/api/status.dart';
import 'package:svmj_web/models/post_item.dart';
import 'package:svmj_web/views/widgets/gloable_content_layout.dart';
import 'package:svmj_web/views/widgets/globle_layout.dart';
import 'package:svmj_web/views/widgets/home_stream.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeDataController homeDataController = Get.find();
  // final AnotherController anotherController = Get.put();

  Widget buildSliverList(context) {
    return Obx(() {
      return MediaQuery.removePadding(
          //removeTop: true,
          context: context,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: homeDataController.items.length + 1,
            itemBuilder: (context, index) {
              if (index == homeDataController.items.length) {
                homeDataController.loadMore();
                return Center(child: CircularProgressIndicator());
              }
              return HomeStream(
                item: homeDataController.items[index],
                index: index,
              );
            },
          ));
    });
  }

  Widget buildSliverList2() {
    return Obx(() {
      return ListView.builder(
        itemCount: homeDataController.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Other Item ${homeDataController.items[index]}'),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GlobleLayout(
        widget: GloableContentLayout(
      tabs: [
        Tab(text: 'foryou'.tr),
        Tab(text: 'following'.tr),
      ],
      tabViews: [
        buildSliverList(context),
        buildSliverList(context),
      ],
      onRefreshCallbacks: [
        homeDataController.refreshData,
        homeDataController.refreshData, // Example for another tab
      ],
    ));
  }
}

class AnotherController {
  var items = <PostItem>[].obs;
  var isLoadingMore = false.obs;
  var loadingStatus = LoadingStatus.loading.obs;
  var errorMessage = ''.obs;
  final dio = Dio();
  var isSharedList = <bool>[].obs;

  void toggleShareAt(int index) {
    // 切换指定索引的分享状态
    isSharedList[index] = !isSharedList[index];
  }

  Future<void> refreshData() async {
    items.clear();
    isSharedList.clear();

    await loadMore();
  }

  Future<void> loadMore() async {
    isLoadingMore.value = true;
    loadingStatus.value = LoadingStatus.loading;
    try {
      final response = await makeHttpRequest(
        (Api.HOME_LoadMore),
        jsonEncode(<String, dynamic>{
          'offset': items.length,
          'limit': 20,
        }),
      );

      for (var item in response['body']) {
        items.add(PostItem.fromJson(item));
        isSharedList.add(false);
      }
      loadingStatus.value = LoadingStatus.success;
    } catch (e) {
      loadingStatus.value = LoadingStatus.error;
      errorMessage.value = 'Error occurred while loading more data: $e';
      if (kDebugMode) {
        print(errorMessage);
      }
    } finally {
      isLoadingMore.value = false;
    }
  }
}
/* 
class HomePageBase extends StatelessWidget {
  final HomeDataController homeDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.sizeOf(context).width <= 500;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: homeDataController.refreshData,
          child: CustomScrollView(
            slivers: [
              if (isSmallScreen)
                SliverAppBar(
                  pinned: false,
                  floating: false,
                  snap: false,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: Image.network(
                            width: 30,
                            height: 30,
                            'https://code.404sec.com/avatars/49e147dfd7c4b5b58d91d6c99e7425e73951f48559e740401d956799bf855419',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              print(error);
                              return Icon(Icons.error);
                            },
                          ),
                        ),
                      ),
                      Image.asset(
                        "images/avatar.jpg",
                        width: 75,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          print(error);
                          return Icon(Icons.error);
                        },
                      ),
                      const SizedBox(width: 75),
                    ],
                  ),
                ),
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                title: TabBar(
                  tabs: [
                    Tab(text: 'Tab 1'),
                    Tab(text: 'Tab 2'),
                  ],
                ),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  children: [
                    Obx(() => buildSliverList()),
                    buildSliverList2(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSliverList() {
    return ListView.builder(
      itemCount: homeDataController.items.length + 1,
      itemBuilder: (context, index) {
        if (index == homeDataController.items.length) {
          homeDataController.loadMore();
          return Center(child: CircularProgressIndicator());
        }
        return HomeStream(
          item: homeDataController.items[index],
          index: index,
        );
      },
    );
  }

  Widget buildSliverList2() {
    return ListView.builder(
      itemCount: 10, // replace with actual data
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}
 */