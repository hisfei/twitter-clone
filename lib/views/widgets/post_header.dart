import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/models/post_item.dart';
import 'package:svmj_web/views/widgets/clickable_circle_avatar.dart';
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
            name: item.isIdea ? item.authorName : item.replyAuthorName,
            username: item.isIdea ? item.authorCode : item.replyAuthorCode,
            bio: '这是个人简介',
            replyTime: '5分钟前',
            minSize: 30,
            maxSize: 50,
            overlayContent: CustomOverlayContent(),
            imageUrl: item.isIdea ? item.authorAvatar : item.replyAuthorAvatar,
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
                    child: SizedBox(width: 8),
                  ),
                  TextSpan(
                    text: item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
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
                    child: SizedBox(width: 8),
                  ),
                  TextSpan(
                    text: item.createdAt,
                    style: const TextStyle(
                      fontSize: 13,
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
    ]);
  }
}
