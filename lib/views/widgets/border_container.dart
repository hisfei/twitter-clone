import 'package:flutter/material.dart';

class MyBorderContainer extends StatelessWidget {
  final String location;
  final Widget widget;

  MyBorderContainer({
    required this.widget,
    required this.location,
  });

  // 私有方法，用于生成边框装饰
  BoxDecoration _borderDecoration(BorderSide borderSide) {
    if (location == 'lr') {
      return BoxDecoration(
        border: Border(
          left: borderSide,
          right: borderSide,
        ),
      );
    }

    return BoxDecoration(
      border: Border(
        top: location == 'top' ? borderSide : BorderSide.none,
        bottom: location == 'bottom' ? borderSide : BorderSide.none,
        left: location == 'left' ? borderSide : BorderSide.none,
        right: location == 'right' ? borderSide : BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BorderSide borderSide = const BorderSide(
      color: Color(0xffe0e8eb),
      width: 0.5,
    );

    return Container(
      decoration: _borderDecoration(borderSide),
      child: widget,
    );
  }
}
