import 'package:get/get.dart';

class NewRecordController extends GetxController {
  RxDouble length = 12.0.obs;
  RxBool numbers = true.obs;
  RxBool lowercase = true.obs;
  RxBool uppercase = true.obs;
  RxBool symbols = false.obs;

  toggleNumbers() => numbers(!numbers.value);
  toggleLowercase() => lowercase(!lowercase.value);
  toggleUppercase() => uppercase(!uppercase.value);
  toggleSymbols() => symbols(!symbols.value);

  setLength(double value) => length(value);
}
