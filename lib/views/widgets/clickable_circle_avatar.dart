import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/clickable_circle_avatar_controller.dart';

class ClickableCircleAvatar2 extends StatelessWidget {
  final double radius;
  final String imageUrl;
  final String userName;
  final String userCode;
  final String bio;
  final String replyTime;
  final Widget overlayContent;
  final VoidCallback onTap;
  final double minSize;
  final double maxSize;

  ClickableCircleAvatar2({
    required this.radius,
    required this.imageUrl,
    required this.userName,
    required this.userCode,
    required this.bio,
    required this.replyTime,
    required this.overlayContent,
    required this.onTap,
    this.minSize = 60,
    this.maxSize = 100,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClickableCircleAvatarController>(
      init: ClickableCircleAvatarController(), // 初始化 GetX 控制器
      builder: (controller) {
        controller.updateOverlayContent(overlayContent);
        return Container(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Row(
            children: [
              MouseRegion(
                onEnter: (_) => controller.showOverlay(context),
                //onExit: (_) => controller.hideOverlay(500),
                child: GestureDetector(
                  child: Container(
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
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: onTap,
                          child: Text(
                            userName,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: onTap,
                          child: Text(
                            '@$userCode',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
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
            ],
          ),
        );
      },
    );
  }
}
