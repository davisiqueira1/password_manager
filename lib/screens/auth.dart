import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:password_manager/utils/color_palette.dart';
import 'package:password_manager/widgets/form_text_field.dart';
import 'package:password_manager/widgets/get_verification_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _registerFormKey = GlobalKey<FormState>();
  final _loginFormKey = GlobalKey<FormState>();
  bool _formIsReg = Get.arguments["registerTab"] ?? false;

  void _toggleRegister(bool btnIsReg) {
    if (_formIsReg != btnIsReg) {
      setState(() {
        _formIsReg = !_formIsReg;
      });
    }
  }

  String? _validatePhoneNumber(String? fieldValue) {
    if (fieldValue == null || fieldValue.length != 19) {
      return "Invalid phone number";
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
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 25),
          child: Center(
            child: Column(
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
                                        color: _formIsReg
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
                                          color: _formIsReg
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
                                        color: !_formIsReg
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
                                          color: !_formIsReg
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
                        _formIsReg
                            ? Form(
                                key: _registerFormKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text(
                                      "Personal details",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: ColorPalette.black,
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.025),
                                    const FormTextField(label: "First name"),
                                    SizedBox(height: screenHeight * 0.020),
                                    const FormTextField(label: "Last name"),
                                    SizedBox(height: screenHeight * 0.020),
                                    FormTextField(
                                      label: "Mobile no.",
                                      keyboardType: TextInputType.phone,
                                      mask: MaskTextInputFormatter(
                                        mask: "+## (##) #####-####",
                                        filter: {"#": RegExp(r'[0-9]')},
                                        type: MaskAutoCompletionType.eager,
                                      ),
                                      validator: _validatePhoneNumber,
                                    ),
                                  ],
                                ),
                              )
                            : Form(
                                key: _loginFormKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text(
                                      "Enter mobile no.",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: ColorPalette.black,
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.025),
                                    FormTextField(
                                      label: "Mobile no.",
                                      keyboardType: TextInputType.phone,
                                      mask: MaskTextInputFormatter(
                                        mask: "+## (##) #####-####",
                                        filter: {"#": RegExp(r'[0-9]')},
                                        type: MaskAutoCompletionType.eager,
                                      ),
                                      validator: _validatePhoneNumber,
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                GetVerificationButton(
                  "Get verification code",
                  onPressed: _formIsReg ? _register : _login,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
