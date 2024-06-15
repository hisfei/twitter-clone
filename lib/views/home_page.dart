import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/views/globle_layout.dart';
import '../controllers/home_controller.dart';
import 'widgets/home_stream.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobleLayout(
      widget: HomePageBase(),
    );
  }
}

class HomePageBase extends StatelessWidget {
  final HomeDataController homeDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.sizeOf(context).width <= 500;

    return Scaffold(
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
            Obx(() => buildSliverList()),
          ],
        ),
      ),
    );
  }

  Widget buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == homeDataController.items.length) {
            homeDataController.loadMore();
            return Center(child: CircularProgressIndicator());
          }
          return HomeStream(
            item: homeDataController.items[index],
            index: index,
          );
        },
        childCount: homeDataController.items.length + 1,
      ),
    );
  }
}
