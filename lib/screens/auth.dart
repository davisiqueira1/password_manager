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
  // sign up
  final _signUpNameController = TextEditingController();
  final _signUpEmailController = TextEditingController();
  final _signUpPasswordController = TextEditingController();
  final _signUpConfirmPasswordController = TextEditingController();
  // sign in
  final _signInEmailController = TextEditingController();
  final _signInPasswordController = TextEditingController();
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

  String? _validateName(String? name) {
    if (name == null || name.isEmpty) {
      return "Invalid name";
    }
    return null;
  }

  String? _validatePassword(String? password) {
    if (password == null || password.isEmpty || password.length < 5) {
      return "Invalid password";
    }
    return null;
  }

  Future<void> _register() async {
    final valid = _registerFormKey.currentState!.validate();
    if (!valid) return;
    if (_signUpPasswordController.text !=
        _signUpConfirmPasswordController.text) {
      Get.snackbar("Authentication error", "Passwords don't match");
      return;
    }
    _authController.toggleLoading();
    try {
      await _authController.registerWithEmail(
        _signUpNameController.text,
        _signUpEmailController.text,
        _signUpPasswordController.text,
      );
      // Get.off
    } finally {
      _authController.toggleLoading();
    }
  }

  Future<void> _login() async {
    final valid = _loginFormKey.currentState!.validate();
    if (!valid) return;
    _authController.toggleLoading();
    try {
      await _authController.loginWithEmail(
        _signInEmailController.text,
        _signInPasswordController.text,
      );
      // Get.off
    } finally {
      _authController.toggleLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Obx(
      () => Stack(
        children: [
          SafeArea(
            child: Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      passblockLogo(),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.0514),
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
                                      registerLabel(),
                                      loginLabel(),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.025),
                              _authController.formIsRegObx.value
                                  ? registerForm(screenHeight)
                                  : loginForm(screenHeight),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      AuthButton(
                        _authController.formIsRegObx.value
                            ? "Register"
                            : "Login",
                        onPressed: _authController.formIsRegObx.value
                            ? _register
                            : _login,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (_authController.loading.value)
            const Opacity(
              opacity: 0.25,
              child: ModalBarrier(
                dismissible: false,
                color: Colors.black,
              ),
            ),
          if (_authController.loading.value)
            const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
        ],
      ),
    );
  }

  Column passblockLogo() {
    return Column(
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
      ],
    );
  }

  Expanded loginLabel() {
    return Expanded(
      child: GestureDetector(
        onTap: () => _toggleRegister(false),
        child: Container(
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color:
                !_authController.formIsRegObx.value ? ColorPalette.black : null,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 18,
              color: !_authController.formIsRegObx.value
                  ? ColorPalette.white
                  : ColorPalette.black,
            ),
          ),
        ),
      ),
    );
  }

  Expanded registerLabel() {
    return Expanded(
      child: GestureDetector(
        onTap: () => _toggleRegister(true),
        child: Container(
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color:
                _authController.formIsRegObx.value ? ColorPalette.black : null,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Text(
            "Register",
            style: TextStyle(
              fontSize: 18,
              color: _authController.formIsRegObx.value
                  ? ColorPalette.white
                  : ColorPalette.black,
            ),
          ),
        ),
      ),
    );
  }

  Form registerForm(double screenHeight) {
    return Form(
      key: _registerFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          FormTextField(
            label: "Name",
            validator: _validateName,
            controller: _signUpNameController,
          ),
          SizedBox(height: screenHeight * 0.020),
          FormTextField(
            label: "E-mail",
            keyboardType: TextInputType.emailAddress,
            validator: _validateEmail,
            controller: _signUpEmailController,
          ),
          SizedBox(height: screenHeight * 0.025),
          FormTextField(
            label: "Password",
            obscureText: true,
            controller: _signUpPasswordController,
            validator: _validatePassword,
          ),
          SizedBox(height: screenHeight * 0.025),
          FormTextField(
            label: "Confirm password",
            obscureText: true,
            controller: _signUpConfirmPasswordController,
            validator: _validatePassword,
          ),
        ],
      ),
    );
  }

  Form loginForm(double screenHeight) {
    return Form(
      key: _loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            keyboardType: TextInputType.emailAddress,
            validator: _validateEmail,
            controller: _signInEmailController,
          ),
          SizedBox(height: screenHeight * 0.025),
          FormTextField(
            label: "Password",
            obscureText: true,
            validator: _validatePassword,
            controller: _signInPasswordController,
          ),
        ],
      ),
    );
  }
}
