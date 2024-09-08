import 'package:get/get.dart';
import 'package:random_string_generator/random_string_generator.dart';

class NewRecordController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    password = RxString(_generate());
  }

  late RxString password;

  // TODO password strength

  final double minLength = 5;
  final double maxLength = 24;

  final Map<String, RxBool> _settings = {
    "Numbers": true.obs,
    "Lowercase": true.obs,
    "Uppercase": true.obs,
    "Symbols": false.obs,
  };

  get settings => _settings;

  late RxDouble length = (maxLength / 2).obs;

  setLength(double value) => length(value);

  void toggleSetting(bool? value, String key) {
    _settings[key]?.value = value ?? false;
  }

  void generate() {
    password(_generate());
  }

  String _generate() {
    final numbers = _settings["Numbers"]!.value;
    final lowercase = _settings["Lowercase"]!.value;
    final uppercase = _settings["Uppercase"]!.value;
    final symbols = _settings["Symbols"]!.value;

    const customSymbols = "!@#\$%&*-_";

    final generator = RandomStringGenerator(
      hasAlpha: true,
      alphaCase: lowercase && !uppercase
          ? AlphaCase.LOWERCASE_ONLY
          : !lowercase && uppercase
              ? AlphaCase.UPPERCASE_ONLY
              : AlphaCase.MIXED_CASE,
      hasDigits: numbers,
      hasSymbols: symbols,
      customSymbols: customSymbols.split(''),
      fixedLength: length.value.toInt(),
      mustHaveAtLeastOneOfEach: false,
    );

    return generator.generate();
  }
}
