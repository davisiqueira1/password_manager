import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/controllers/auth_controller.dart';
import 'package:password_manager/utils/color_palette.dart';
import 'package:password_manager/widgets/form_text_field.dart';
import 'package:password_manager/widgets/auth_button.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  final _registerFormKey = GlobalKey<FormState>();
  final _loginFormKey = GlobalKey<FormState>();
  final _authController =
      Get.put(AuthController(formIsReg: Get.arguments["registerTab"] ?? false));

  void _toggleRegister(bool btnIsReg) {
    if (_authController.formIsRegObx.value != btnIsReg) {
      _authController.toggleFormIsReg();
    }
  }

  String? _validateEmail(String? email) {
    if (email == null ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
            .hasMatch(email)) {
      return "Invalid e-mail";
    }
    return null;
  }

  void _register() {
    final valid = _registerFormKey.currentState!.validate();
    if (!valid) {
      return;
    }
  }

  void _login() {
    final valid = _loginFormKey.currentState!.validate();
    if (!valid) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset("assets/images/app_icon.svg"),
                  const Text(
                    "Passblock",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: ColorPalette.black,
                    ),
                  ),
                  const Text(
                    "Frictionless Security",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.0514),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.025,
                        horizontal: screenWidth * 0.035,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => _toggleRegister(true),
                                      child: Container(
                                        height: 40,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color:
                                              _authController.formIsRegObx.value
                                                  ? ColorPalette.black
                                                  : null,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: Text(
                                          "Register",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: _authController
                                                    .formIsRegObx.value
                                                ? ColorPalette.white
                                                : ColorPalette.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => _toggleRegister(false),
                                      child: Container(
                                        height: 40,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: !_authController
                                                  .formIsRegObx.value
                                              ? ColorPalette.black
                                              : null,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: !_authController
                                                    .formIsRegObx.value
                                                ? ColorPalette.white
                                                : ColorPalette.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.025),
                          _authController.formIsRegObx.value
                              ? Form(
                                  key: _registerFormKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Text(
                                        "Personal details",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: ColorPalette.black,
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.025),
                                      const FormTextField(label: "Name"),
                                      SizedBox(height: screenHeight * 0.020),
                                      FormTextField(
                                        label: "E-mail",
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: _validateEmail,
                                      ),
                                      SizedBox(height: screenHeight * 0.025),
                                      const FormTextField(
                                        label: "Password",
                                        obscureText: true,
                                      ),
                                      SizedBox(height: screenHeight * 0.025),
                                      const FormTextField(
                                        label: "Confirm password",
                                        obscureText: true,
                                      ),
                                    ],
                                  ),
                                )
                              : Form(
                                  key: _loginFormKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Text(
                                        "Account information",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: ColorPalette.black,
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.025),
                                      FormTextField(
                                        label: "E-mail",
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: _validateEmail,
                                      ),
                                      SizedBox(height: screenHeight * 0.025),
                                      const FormTextField(
                                        label: "Password",
                                        obscureText: true,
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  AuthButton(
                    _authController.formIsRegObx.value ? "Register" : "Login",
                    onPressed:
                        _authController.formIsRegObx.value ? _register : _login,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
