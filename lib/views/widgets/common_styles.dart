import 'package:flutter/material.dart';

class CommonStyles {
  static SliverAppBar buildAppBar(
      int i, Widget title, Widget  leading, TabBar tabBar) {
    if (i == 1) {
      return SliverAppBar(
          floating: false,
          pinned: false, // 设置为 false，让 AppBar 不固定在顶部
          snap: false,
          toolbarHeight: 35,
          title: title,
          leading: Padding(
              padding: const EdgeInsets.only(left: 15.0), child:     leading,


      )   ,
          //  actions: actions,
          bottom: _buildTabBarWithHeight(tabBar, 35));
    } else {
      return SliverAppBar(
          toolbarHeight: 0,
          floating: false,
          pinned: false, // 设置为 false，让 AppBar 不固定在顶部
          snap: false,

          //  actions: actions,
          bottom: _buildTabBarWithHeight(tabBar, 50));
    }
  }

  static Widget buildNetworkImage(String url, double width, double height) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: Image(
          image: NetworkImage(url),
          width: width,
          height: height,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
             return const Icon(Icons.error);
          },
        ),
      ),
    );
  }

  static PreferredSize _buildTabBarWithHeight(TabBar tabBar, double height) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Container(
        height: height,
        child: tabBar,
      ),
    );
  }

  static Widget buildAssetImage(String assetPath, double width) {
    return Image.asset(
      assetPath,
      width: width,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
         return const Icon(Icons.error);
      },
    );
  }
}
