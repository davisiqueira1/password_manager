import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/utils/color_palette.dart';
import 'package:password_manager/widgets/button_to_login.dart';
import 'package:password_manager/widgets/register_button.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: RegisterButton(
                screenWidth: screenWidth,
                onPressed: () {},
              ),
            ),
            Center(
              child: ButtonToLogin(
                screenWidth: screenWidth,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
