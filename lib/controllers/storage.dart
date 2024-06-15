import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Store extends GetxController {
  Rx<GetStorage> postContentDataRequest = GetStorage().obs;
}
