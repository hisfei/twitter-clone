import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/post_content_controller.dart';
import 'package:svmj_web/models/post_item.dart';

class PostHeader extends StatelessWidget {
  final PostItem item;
  PostHeader({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SelectableText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: item.tag,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff279bf0),
                    backgroundColor: Color(0xFFf8f8f8),
                  ),
                ),
                WidgetSpan(
                  child: SizedBox(width: 10),
                ),
                TextSpan(
                  text: item.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      //dataController.changePage(3); // 切换到 content_page

                      Get.toNamed('/content/' +
                          item.postCode.toString() +
                          '/' +
                          item.replyCode.toString());
                      //Navigator.pushNamed(context, '/details');
                    },
                ),
                WidgetSpan(
                  child: SizedBox(width: 10),
                ),
                TextSpan(
                  text: item.createdAt,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
