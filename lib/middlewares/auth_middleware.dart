import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    print("===============Current route: $route");
    // 根据实际业务逻辑检查权限
// 替换为实际的认证逻辑
    // if (!isAuthenticated) {
    return RouteSettings(name: "/login");
    // }
    //return null;
  }
}
