import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GC extends GetxController {
 late BuildContext   context;
setContext(BuildContext contextd){
  context =contextd;
}
 BuildContext getContext(){
  return context;
}
}