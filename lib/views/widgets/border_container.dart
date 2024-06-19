import 'package:flutter/material.dart';

class MyBorderContainer extends StatelessWidget {
  MyBorderContainer({required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Color(0xffe0e8eb), // 设置上边框颜色
              width: 0.50, // 设置上边框宽度
            ),
          ),
        ),
        child: widget);
  }
}
