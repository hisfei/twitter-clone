import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyColor {
  static Color borderGrey = const Color(0xffe0e8eb);
  static Color black = const Color(0xFF0D0D10);
  static Color blue = const Color(0xff279bf0);
  static Color white = const Color(0xFFFFFFFF);
}

class AppTheme {
  static final ThemeData lighThemeData = ThemeData(
      fontFamily: 'PingFang SC',
      primaryColor: const Color(0xff279bf0),
      hintColor: const Color(0xFF0D0D10),
      scaffoldBackgroundColor: Colors.white,
      cardColor: const Color(0xFFFFFFFF),
      appBarTheme: const AppBarTheme(
        //color: Color(0xFFF5F8FA),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFFFFFFFF), // AppBar 背景色
        foregroundColor: Color(0xFF0D0D10), // AppBar 前景色（图标、文字等）
      ),
      tabBarTheme: TabBarTheme(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: const Color(0xff279bf0), // 底部导航栏背景色
          // overlayColor: WidgetStateColor.resolveWith(
          //   (states) => Color(0xff279bf0).withOpacity(0.3)),
          labelStyle: const TextStyle(color: Color(0xFF0D0D10), fontSize: 14),
          unselectedLabelColor: Colors.grey,
          dividerColor: const Color(0xffe0e8eb),
          dividerHeight: 0.5),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFFFFFFFF), // 底部导航栏背景色
          selectedItemColor: Color(0xFF0D0D10), // 选中的项颜色
          unselectedItemColor: Colors.grey, // 未选中的项颜色
          selectedIconTheme: IconThemeData(size: 25),
          unselectedIconTheme: IconThemeData(size: 24)),
      textSelectionTheme:
          const TextSelectionThemeData(selectionColor: Colors.grey),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        //color: Colors.blue, // 下拉刷新指示器颜色
        refreshBackgroundColor: Color(0xff279bf0), //#279bf0
        // 其他属性
      ),
      navigationRailTheme: const NavigationRailThemeData(
          backgroundColor: Color(0xFFFFFFFF),
          labelType: NavigationRailLabelType.all,
          selectedLabelTextStyle:
              TextStyle(color: Color(0xFF0D0D10), fontSize: 14),
          unselectedLabelTextStyle: TextStyle(color: Colors.grey, fontSize: 13),
          useIndicator: false,
          selectedIconTheme: IconThemeData(fill: 1)));
}
