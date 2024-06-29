import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/utils/color_palette.dart';
import 'package:password_manager/widgets/code_field.dart';
import 'package:password_manager/widgets/get_verification_button.dart';

class CodeVerificationScreen extends StatefulWidget {
  const CodeVerificationScreen({super.key});

  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  final _formKey = GlobalKey<FormState>();

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
                  width: screenWidth,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.025,
                      horizontal: screenWidth * 0.035,
                    ),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          "Enter verification code",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.025),
                        Form(
                          key: _formKey,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              CodeField(),
                              CodeField(),
                              CodeField(),
                              CodeField(
                                lastField: true,
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
                  "Continue",
                  onPressed: () {
                    _formKey.currentState!.validate();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
