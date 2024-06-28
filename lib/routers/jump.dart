
import 'package:get/get.dart';

//跳转下一个页面
void JumpTo(String url ) {
 // Get.offAndToNamed(url,id: 2);
  Get.toNamed(url,id: 2);
  print(url);

}

//关掉当前页面，跳转下一个页面
void JumpOffTo(String url ) {
   Get.offAndToNamed(url,id: 2);
  //Get.offNamed(url,id: 2);
}

//关掉所有页面，跳转下一个页面
void JumpOffAllTo(String url ) {
  Get.offAllNamed( url,id: 2);
}

void JumpBack(){
  Get.back(id:2);
}