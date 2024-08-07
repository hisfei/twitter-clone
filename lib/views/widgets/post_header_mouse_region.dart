import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/overlay_user_info_controller.dart';

class PostHeaderMouseRegion extends StatelessWidget {
  final double radius;
  final String imageUrl;
  final String userName;
  final String userCode;
  final bool isVerified;
  final String replyTime;
  final Widget overlayContent;
  final VoidCallback onTap;
  final double minSize;
  final double maxSize;
  // BuildContext contexted;
  PostHeaderMouseRegion({
    super.key,
    required this.radius,
    required this.imageUrl,
    required this.userName,
    required this.userCode,
    required this.isVerified,
    required this.replyTime,
    required this.overlayContent,
    required this.onTap,
    // required this.contexted,
    this.minSize = 60,
    this.maxSize = 100,
  });
  OverlayUserInfoController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    controller.updateOverlayContent(overlayContent);
    return Container(
      constraints: const BoxConstraints(maxWidth: 360),
      child: Row(
        children: [
          MouseRegion(
            onEnter: (_) => controller.showOverlay(context, userCode),
            onExit: (_) => controller.cancalTimer(),
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
                      Icon(
                      Icons.verified,
                      color: isVerified==true?Colors.blue:Colors.grey,
                      size: 13,
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
                /*Row(
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
                    ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
