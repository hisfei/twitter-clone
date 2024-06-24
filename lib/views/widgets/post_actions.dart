import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/home_stream_controller.dart';

class PostActions extends StatelessWidget {
  final int index;
  final HomeStreamController homeStreamController = Get.find();

  PostActions({required this.index});

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
              homeStreamController.toggleShareAt(index);
            }
          },
          child: Obx(() => Icon(
                homeStreamController.isForYouSharedList[index]
                    ? CupertinoIcons.share
                    : Icons.ios_share_outlined,
                color: Colors.grey,
                size: 18,
              )),
        ),
        const SizedBox(),
      ],
    );
  }
}
