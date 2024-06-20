import 'package:flutter/material.dart';
import 'common_styles.dart';

class GloableContentLayout extends StatelessWidget {
  final List<Widget> tabs;
  final List<Widget> tabViews;
  final List<Future<void> Function()> onRefreshCallbacks;

  GloableContentLayout({
    required this.tabs,
    required this.tabViews,
    required this.onRefreshCallbacks,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.sizeOf(context).width <= 600;
    final bool showTabs = tabs.length > 1;

    return DefaultTabController(
      length: showTabs ? tabs.length : 1,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            if (isSmallScreen) {
              return [
                CommonStyles.buildAppBar(
                    1,
                    CommonStyles.buildAssetImage('images/logo.png', 50),
                    CommonStyles.buildNetworkImage(
                      'https://code.404sec.com/avatars/49e147dfd7c4b5b58d91d6c99e7425e73951f48559e740401d956799bf855419',
                      35,
                      35,
                    ),
                    TabBar(
                      tabs: tabs,
                    ))
              ];
            } else {
              return [
                CommonStyles.buildAppBar(
                    2,
                    Text(''),
                    Text(''),
                    TabBar(
                      tabs: tabs,
                    ))
              ];
            }
          },
          body: showTabs ? buildTabView() : buildSingleView(),
        ),
        // body: showTabs ? buildTabView() : buildSingleView(),
      ),
    );
  }

  Widget buildTabView() {
    return TabBarView(
      children: List.generate(tabs.length, (index) {
        return RefreshIndicator(
          onRefresh: onRefreshCallbacks[index],
          child: tabViews[index],
        );
      }),
    );
  }

  Widget buildSingleView() {
    return tabViews.isNotEmpty
        ? RefreshIndicator(
            onRefresh: onRefreshCallbacks.isNotEmpty
                ? onRefreshCallbacks[0]
                : () async {},
            child: tabViews[0],
          )
        : Center(child: Text("No Content"));
  }
}
