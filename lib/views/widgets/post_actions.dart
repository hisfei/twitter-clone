import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/home_stream_controller.dart';

class PostActions extends StatelessWidget {
  final int index;
  final HomeStreamController homeStreamController = Get.find();
 final int type;
  PostActions({required this.index, required this.type});

  @override
  Widget build(BuildContext context) {


    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        const Icon(
          CupertinoIcons.chat_bubble,
          color: Colors.grey,
          size: 18,
        ),
        const SizedBox(),
        const Icon(
          CupertinoIcons.arrow_2_squarepath,
          color: Colors.grey,
          size: 18,
        ),
        const SizedBox(),
        const Icon(
          CupertinoIcons.heart,
          color: Colors.grey,
          size: 18,
        ),
        const SizedBox(),
        const Icon(
          CupertinoIcons.chart_pie,
          size: 18,
          color: Colors.grey,
        ),
        const SizedBox(),
        GestureDetector(
          onTap: () {
            if (homeStreamController.loadingStat.value !=1 ) {
             type==1?  homeStreamController.toggleForYouShareAt(index):homeStreamController.toggleFollowingShareAt(index);
            }
          },
          child: Obx(() => Icon(

            (type==1? (homeStreamController.isForYouSharedList[index]):(homeStreamController.isFollowingSharedList[index]))
                    ? CupertinoIcons.share
                    : Icons.ios_share_outlined ,
                 color: Colors.grey,
                size: 18,
              )),
        ),
        const SizedBox(),
      ],
    );
  }
}
