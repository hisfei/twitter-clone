import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/models/post_item.dart';
import 'package:svmj_web/views/widgets/avatar.dart';
import 'package:svmj_web/views/widgets/profile_card.dart';

class PostHeader extends StatelessWidget {
  final PostItem item;
  PostHeader({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          ClickableCircleAvatar(
            radius: 30,
            name: 'John Doe',
            username: 'johndoe',
            bio: '这是个人简介',
            replyTime: '5分钟前',
            minSize: 30,
            maxSize: 30,
            overlayContent: CustomOverlayContent(),
            imageUrl:
                'https://code.404sec.com/avatars/49e147dfd7c4b5b58d91d6c99e7425e73951f48559e740401d956799bf855419',
            onTap: () {
              // 执行其他操作
              print('CircleAvatar 被点击了');
            },
          ),
        ],
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          Expanded(
            child: SelectableText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: item.tag,
                    style: TextStyle(
                      fontSize: 13.0,
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
                      fontSize: 14,
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
      ),
      const SizedBox(
        height: 5,
      ),
    ]);
  }
}
