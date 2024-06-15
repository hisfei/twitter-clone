import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/home_controller.dart';
import 'package:svmj_web/models/post_item.dart';
import 'package:svmj_web/views/widgets/post_header.dart';
import 'package:svmj_web/views/widgets/imge_grid.dart';
import 'package:svmj_web/views/widgets/image_viewer.dart';
import 'package:svmj_web/views/widgets/post_actions.dart';

class HomeStream extends StatelessWidget {
  final PostItem item;
  final int index;
  final HomeDataController homeDataController = Get.find();

  HomeStream({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostHeader(item: item),
            const SizedBox(height: 8),
            SelectableText(
              item.replyContent,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            ImageGrid(
              imageUrls: item.imageUrls,
              onImageTap: (imageUrl) {
                showDialog(
                  context: context,
                  builder: (context) => ImageViewer(imageUrl: imageUrl),
                );
              },
            ),
            const SizedBox(height: 15),
            PostActions(index: index),
            const SizedBox(height: 8),
            Center(
              child: Container(
                height: 0.3,
                width: 500,
                color: const Color.fromARGB(255, 215, 215, 215),
                margin: const EdgeInsets.only(top: 5.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
