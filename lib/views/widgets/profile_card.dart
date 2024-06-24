 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svmj_web/controllers/clickable_circle_avatar_controller.dart';
import 'package:svmj_web/controllers/user_info_controller.dart';
import 'package:svmj_web/themes/light.dart';

class ProfileCard extends StatelessWidget {
  final ClickableCircleAvatarController clickableCircleAvatarController = Get.find();
  final UserInfoController profileCard = Get.find();
  final String userCode;

  ProfileCard({super.key, required this.userCode});

  @override
  Widget build(BuildContext context) {
    profileCard.getUserInfo(userCode);
    return Obx(() {
      if (profileCard.loadingStat.value != 2) {
        return Container(
            width: 280,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: const Center(child: CircularProgressIndicator()));
      } else {
        return MouseRegion(
            onEnter: (_) =>
                clickableCircleAvatarController.showOverlay(context),
            onExit: (_) => clickableCircleAvatarController.hideOverlay(0),
            child: Container(
              width: 280,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderSection(context),
                  const SizedBox(height: 10),
                  Text(
                    profileCard.u.value.bio,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatItem(
                          count: profileCard.u.value.followingCount,
                          label: 'Following'),
                      const SizedBox(
                        width: 15,
                      ),
                      StatItem(
                          count: profileCard.u.value.followerCount,
                          label: 'Followers'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  //FollowedBySection(),
                ],
              ),
            ));
      }
    });
    /* AsyncPage<String>(
      controller: profileCard,
      builder: MyBuild,
    ); */
  }

  Widget HeaderSection(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(profileCard.u.value.userAvatar),
          ),
          const SizedBox(width: 10),
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
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(
              profileCard.u.value.userName,
              style: GoogleFonts.roboto(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              Icons.verified,
              color: Colors.blue,
              size: 13,
            )
          ],
        ),
        Text(
          '@${profileCard.u.value.userCode}',
          style: GoogleFonts.roboto(
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
      ]),
    ]);
  }
}

class StatItem extends StatelessWidget {
  final String count;
  final String label;

  const StatItem({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          count,
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          label,
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class FollowedBySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 12,
          backgroundImage: AssetImage('assets/elon_musk.png'),
        ),
        const SizedBox(width: 8),
        Text(
          'Followed by Elon Musk',
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
