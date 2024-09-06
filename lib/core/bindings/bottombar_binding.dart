import 'package:get/get.dart';
import 'package:password_manager/core/controllers/bottombar_controller.dart';

class BottomBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomBarController());
  }
}
