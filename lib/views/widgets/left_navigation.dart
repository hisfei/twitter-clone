import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/home_menu_controller.dart';
import 'package:svmj_web/controllers/login_user_info.dart';
import 'package:svmj_web/models/user_info.dart';
import 'package:svmj_web/routers/jump.dart';
 import 'package:svmj_web/themes/light.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class LeftNavigation extends StatelessWidget {
  final HomeMenuController homeMenuController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: LayoutBuilder(
        builder: (context, constraints) {
          double width = MediaQuery.sizeOf(context).width;
          if (width >= 1150) {
            return buildListView(context);
          }
          if (kIsWeb && width <1150 ){
            return buildCenteredIcons(context);
          }
          if (!kIsWeb &&width>=600){
            return buildCenteredIcons(context);
          }
          return   const SizedBox.shrink(); ;
        },
      )),
    );
  }

  Widget buildListView(BuildContext context) {
    return Obx(()=>ListView(children: [
      const Text('Logo'),
      ...buildMenuItems(context),
      const SizedBox(
        height: 250,
      ),
      ProfileMenuButton(),
    ]));
  }

  List<Widget> buildMenuItems(context) {
    return [
      buildListTile(CupertinoIcons.home, 'home'.tr, 0, 'home'),

      buildListTile(CupertinoIcons.search, 'explore'.tr, 1, 'search'),
      buildListTile(
          CupertinoIcons.circle_grid_hex, 'mindRealm'.tr, 2, 'mindrealm'),
      buildListTile(CupertinoIcons.bookmark, 'bookmarks'.tr, 3, 'bookmarks'),
      buildListTile(CupertinoIcons.chat_bubble_2, 'message'.tr, 4,
          'message'), // Example with notifications
      buildListTile(CupertinoIcons.bell, 'notifications'.tr, 5,
          'notifications'), // Example with notifications
      buildListTile(CupertinoIcons.person, 'profile'.tr, 6, 'profile'),
      const Text(''),
      buildPostButton(context),
    ];
  }

  Widget buildPostButton(context) {
    return Container(
        padding: const EdgeInsets.only(left: 15.0, right: 50),
        //width: 200.0, // 设置宽度
        height: 50.0, // 设置高度
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(MyColor.blue),
          ),
          onPressed: () {
            /*  // 弹出对话框
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Alert'),
                  content: Text('This is a dialog message.'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop(); // 关闭对话框
                      },
                    ),
                  ],
                );
              },
            ); */
          },
          child: Text('post'.tr, style: TextStyle(color: MyColor.white)),
        ));
  }

  Widget buildCenteredIcons(BuildContext context) {
    return Obx(()=>Center(
      child: Column(
        children: [
          buildIconButton(CupertinoIcons.home, 0, 'home'),
          buildIconButton(CupertinoIcons.search, 1, 'search'),
          buildIconButton(CupertinoIcons.circle_grid_hex, 2, 'mindrealm'),
          buildIconButton(CupertinoIcons.bookmark, 3, 'bookmarks'),
          buildIconButton(CupertinoIcons.chat_bubble_2, 4,
              'message'), // Example with notifications
          buildIconButton(CupertinoIcons.bell, 5, 'notifications'),
          // Example with notifications
          buildIconButton(CupertinoIcons.person, 6, 'profile'),
        ],
      ),
    ));
  }

  Widget buildListTile(
    IconData icon,
    String title,
    int index,
    String routeName,
  ) {
    bool isSelected = homeMenuController.selectedPage.value == index;

    return ListTile(
      //hoverColor: Colors.blue.withOpacity(0.5), // 指定划过颜色和透明度
      // 可以根据需求调整划过效果的持续时间
       //hoverColor: Colors.blue.withOpacity(0), // 设置划过效果的持续时间为500毫秒
      splashColor: Colors.transparent,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      minTileHeight: 60,
      leading: buildIconButton(icon, index, routeName),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () => onTap(index, routeName),
    );
  }

  Widget buildIconButton(IconData icon, int index, String routeName) {
    bool isSelected = homeMenuController.selectedPage.value == index;

    return Stack(
      children: [
        IconButton(
          icon: Icon(icon),
          iconSize: 30,
          onPressed: () => onTap(index, routeName),
          color: isSelected
              ? MyColor.blue
              : MyColor.black, // Example of changing icon color when selected
        ),
        if (homeMenuController.notificationCount[index] == -1)
          buildNotificationDot(size: 8),
        if (homeMenuController.notificationCount[index] > 0)
          buildNotificationDot(
              size: 15,
              notificationCount: homeMenuController.notificationCount[index]),
      ],
    );
  }

  Widget buildNotificationDot({required double size, int? notificationCount}) {
    return Positioned(
      right: 0,
      top: 0,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: MyColor.blue,
          shape: BoxShape.circle,
        ),
        child: notificationCount != null
            ? Center(
                child: Text(
                  '$notificationCount',
                  style: TextStyle(
                    color: MyColor.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            : null,
      ),
    );
  }

  void onTap(int index, String name) {
    homeMenuController.changePage(index);

    JumpOffTo('/$name'   );
 //   index == 0 ? Get.offAndToNamed('/') : Get.offAndToNamed('/$name' );
  }
}

class ProfileMenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginInfoController userInfoController = Get.find();
    UserInfo userInfo = userInfoController.getUserInfo();

    return ListTile(
      splashColor: Colors.transparent,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      minTileHeight: 60,
      leading: CircleAvatar(
          radius: 20,
          backgroundImage:
              NetworkImage(userInfoController.getUserInfo().backgroundUrl)),
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          userInfo.userName,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '@' + userInfo.userCode,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ]),
      onTap: () => {Get.offAllNamed('/profile')},
    );
  }
}
