import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  static const Color searchColor = Color(0xffe0e8eb);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40.0,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: TextField(
            style: TextStyle(color: searchColor), // 设置文字颜色
            cursorColor: searchColor, // 设置光标颜色
            decoration: InputDecoration(
              hintText: 'Search ',
              hintStyle: TextStyle(color: searchColor), // 设置提示文字颜色
              filled: true,
              fillColor: searchColor.withOpacity(0.1), // 设置输入框背景色为指定颜色的浅色
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: searchColor, // 设置边框颜色
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: searchColor, // 设置聚焦状态下边框颜色
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: searchColor, // 设置非聚焦状态下边框颜色
                  width: 1.0,
                ),
              ),
              prefixIcon: Icon(Icons.search, color: searchColor), // 设置搜索图标颜色
            ),
            // onChanged: controller.filterTrends,
          ),
        ));
  }
}
