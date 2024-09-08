import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/controllers/account_controller.dart';
import 'package:password_manager/core/controllers/session_controller.dart';
import 'package:password_manager/core/controllers/user_controller.dart';
import 'package:password_manager/core/models/account_model.dart';
import 'package:password_manager/core/models/password_model.dart';
import 'package:random_string_generator/random_string_generator.dart';

class NewRecordController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    password = RxString(_generate());
  }

  late RxString password;

  final nameField = TextEditingController();
  final loginField = TextEditingController();

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

  Future<void> saveRecord() async {
    try {
      Password pwd = Password(
        uid: null,
        accountRef: null,
        password: password.value,
        length: length.value.toInt(),
        numbers: _settings["Numbers"]!.value,
        symbols: _settings["Symbols"]!.value,
        lowercase: _settings["Lowercase"]!.value,
        uppercase: _settings["Uppercase"]!.value,
        safety: "placeholder",
      );
      final userId = Get.find<SessionController>().user!.uid;
      final userRef = await UserController.getUserRefById(userId);
      Account acc = Account(
        uid: null,
        userRef: userRef,
        name: nameField.text,
        link: "placeholder", // !
        login: loginField.text,
        passwordRef: null,
        imageUrl: "placeholder", // !
        tags: [],
        priority: false,
      );

      await Get.find<AccountController>().createAccount(acc, pwd);
    } catch (e) {
      print("Error while saving record");
      rethrow;
    }
  }
}
