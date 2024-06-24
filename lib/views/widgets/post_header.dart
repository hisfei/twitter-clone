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
          ClickableCircleAvatar2(
            radius: 20,
            userName: item.isIdea ? item.authorName : item.replyAuthorName,
            userCode: item.isIdea ? item.authorCode : item.replyAuthorCode,
            bio: '这是个人简介',
            replyTime: '5分钟前',
            minSize: 30,
            maxSize: 50,
            overlayContent: ProfileCard(userCode: item.replyAuthorCode),
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
                    style: const TextStyle(
                      fontSize: 13.0,
                      color: Color(0xff279bf0),
                      backgroundColor: Color(0xFFf8f8f8),
                    ),
                  ),
                  const WidgetSpan(
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

                        Get.toNamed('/post/${item.postCode}/${item.replyCode}');
                        //Navigator.pushNamed(context, '/details');
                      },
                  ),
                  const WidgetSpan(
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
