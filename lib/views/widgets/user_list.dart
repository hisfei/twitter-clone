import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/overlay_user_info_controller.dart';
import 'package:svmj_web/models/user_info.dart';
import 'package:svmj_web/routers/jump.dart';
import 'package:svmj_web/themes/light.dart';
import 'package:svmj_web/views/widgets/profile_card.dart';

class UserListPage extends StatelessWidget {
  final UserInfo profile;
  final int index;
  final Widget overlayContent;
  final double minSize;
  final double maxSize;
  final double radius;

  UserListPage(
      {super.key,
      required this.profile,
      required this.index,
      required this.overlayContent,
      this.minSize = 60,
      this.maxSize = 100,
      required this.radius});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserListPageBase(
                radius: 20,
                userName: profile.userName,
                userCode: profile.userCode,
                bio: profile.bio,
                replyTime: '',
                minSize: 30,
                maxSize: 50,
                overlayContent: ProfileCard(),
                imageUrl: profile.userAvatar,
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        // 执行其他操作
        JumpTo('/post/1/2' );
        print('CircleAvatar 被点击了' + profile.userCode);
      },
    );
  }
}

class UserListPageBase extends StatelessWidget {
  final double radius;
  final String imageUrl;
  final String userName;
  final String userCode;
  final String bio;
  final String replyTime;
  final Widget overlayContent;
  final double minSize;
  final double maxSize;

  UserListPageBase({super.key,
    required this.radius,
    required this.imageUrl,
    required this.userName,
    required this.userCode,
    required this.bio,
    required this.replyTime,
    required this.overlayContent,
    this.minSize = 60,
    this.maxSize = 100,
  });
  OverlayUserInfoController overlayPopController =Get.find();
  @override
  Widget build(BuildContext context) {

    overlayPopController.updateOverlayContent(overlayContent);
        return Row(
          children: [
            MouseRegion(
              onEnter: (_) => overlayPopController.showOverlay(context,userCode),
              //onExit: (_) => controller.hideOverlay(300),
              child: GestureDetector(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: minSize,
                    minHeight: minSize,
                    maxWidth: maxSize,
                    maxHeight: maxSize,
                  ),
                  child: CircleAvatar(
                    radius: radius,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '@$userCode',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        bio,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        replyTime,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(1);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColor.black,
                foregroundColor: MyColor.borderGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('follow'.tr),
            ),
          ],
        );

  }
}
