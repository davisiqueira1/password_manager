import 'package:get/get.dart';
import 'package:password_manager/core/controllers/new_record_controller.dart';

class NewRecordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NewRecordController());
  }
}
