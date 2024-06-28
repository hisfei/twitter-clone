import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:svmj_web/models/user_info.dart';

class LoginInfoController extends GetxController {
  final box = GetStorage('ui');

  @override
  void onInit() {
    UserInfo userInfo = UserInfo(
        userCode: 'xiaoming',
        userName: '小明',
        joinDate: '2024-10-22',
        bio: '这是一条简介',
        followingCount: '0',
        followerCount: '0',
        backgroundUrl:
            'http://127.0.0.1:8080/static/2.png',
        userAvatar:
            'http://127.0.0.1:8080/static/1.png',
        mjCount: '0',
        verified: false);
    saveUserInfo(userInfo);
    super.onInit();
  }

  void saveUserInfo(UserInfo userInfo) {
    //  box.write('user', userInfo);
  }

  UserInfo getUserInfo() {
    return UserInfo(
        userCode: 'xiaoming',
        userName: '小明',
        joinDate: '2024-10-22',
        bio: '这是一条简介',
        followingCount: '0',
        followerCount: '0',
        mjCount: '0',
        verified: false,
        backgroundUrl:
            'http://127.0.0.1:8080/static/1.png',
        userAvatar:
            'http://127.0.0.1:8080/static/1.png');

    //return box.read('user');
  }
}
