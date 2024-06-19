import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/views/login_page.dart';

class ClickableCircleAvatar extends StatefulWidget {
  final double radius;
  final String imageUrl;
  final String name;
  final String username;
  final String bio;
  final String replyTime;
  final Widget overlayContent;
  final VoidCallback onTap;
  final double minSize;
  final double maxSize;

  ClickableCircleAvatar({
    required this.radius,
    required this.imageUrl,
    required this.name,
    required this.username,
    required this.bio,
    required this.replyTime,
    required this.overlayContent,
    required this.onTap,
    this.minSize = 60,
    this.maxSize = 100,
  });

  @override
  _ClickableCircleAvatarState createState() => _ClickableCircleAvatarState();
}

class _ClickableCircleAvatarState extends State<ClickableCircleAvatar> {
  OverlayEntry? _overlayEntry;

  void _showOverlay(BuildContext context) {
    _overlayEntry = _createOverlayEntry(context);
    Overlay.of(context)?.insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 5,
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(8),
          child: widget.overlayContent,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 360), // 设置最大宽度
      child: Row(
        children: [
          MouseRegion(
              onEnter: (_) => _showOverlay(context),
              onExit: (_) => _hideOverlay(),
              child: GestureDetector(
                  // onTap: print('1'),
                  child: Container(
                      //constraints: BoxConstraints(maxWidth: 360), // 设置最大宽度
                      child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: widget.minSize,
                  minHeight: widget.minSize,
                  maxWidth: widget.maxSize,
                  maxHeight: widget.maxSize,
                ),
                child: CircleAvatar(
                  radius: widget.radius,
                  backgroundImage: NetworkImage(widget.imageUrl),
                ),
              )))),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => _showOverlay(context),
                      onExit: (_) => _hideOverlay(),
                      child: InkWell(
                        onTap: () {},
                        child: Text.rich(TextSpan(
                          text: widget.name,
                          style: TextStyle(
                            //decoration: TextDecoration.underline,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //dataController.changePage(3); // 切换到 content_page
                              print('Text tapped');

                              Get.to(LoginPage());
                            },
                        )),
                      )),
                  SizedBox(width: 8),
                  MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: InkWell(
                        onTap: () {},
                        child: Text.rich(TextSpan(
                          text: '@' + widget.username,
                          style: TextStyle(
                            // decoration: TextDecoration.underline,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //dataController.changePage(3); // 切换到 content_page

                              Get.to(LoginPage());
                            },
                        )),
                      )),
                ]),
                Row(
                  children: [
                    Text.rich(TextSpan(
                      text: widget.bio,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    )),
                    // Spacer(),
                    SizedBox(width: 8),

                    Text(
                      widget.replyTime,
                      style: TextStyle(
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
  }
}
