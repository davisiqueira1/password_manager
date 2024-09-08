import 'package:get/get.dart';
import 'package:password_manager/core/controllers/account_controller.dart';
import 'package:password_manager/core/controllers/bottombar_controller.dart';

class MainNavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomBarController());
    Get.lazyPut(() => AccountController());
  }
}
