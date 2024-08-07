 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svmj_web/controllers/overlay_user_info_controller.dart';
import 'package:svmj_web/themes/light.dart';

class ProfileCard extends StatelessWidget {
  final OverlayUserInfoController overlayPopController = Get.find();

  ProfileCard({super.key });

  @override
  Widget build(BuildContext context) {
     return Obx(() {
      if (overlayPopController.loadingStat.value != 2) {
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
                overlayPopController.showOverlay(context,overlayPopController.u.value.userCode),
            onExit: (_) => overlayPopController.hideOverlay(0),
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
                    overlayPopController.u.value.bio,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatItem(
                          count: overlayPopController.u.value.followingCount,
                          label: 'Following'),
                      const SizedBox(
                        width: 15,
                      ),
                      StatItem(
                          count: overlayPopController.u.value.followerCount,
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
            backgroundImage: NetworkImage(overlayPopController.u.value.userAvatar),
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
              overlayPopController.u.value.userName,
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
          '@${overlayPopController.u.value.userCode}',
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
