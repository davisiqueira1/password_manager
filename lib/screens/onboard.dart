import 'package:flutter/material.dart';
import 'package:password_manager/widgets/button_to_login.dart';
import 'package:password_manager/widgets/carousel_onboard.dart';
import 'package:password_manager/widgets/register_button.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Spacer(flex: 2),
            const CarouselOnboard(),
            const Spacer(flex: 1),
            RegisterButton(onPressed: () {}),
            SizedBox(height: screenHeight * 0.015),
            ButtonToLogin(onPressed: () {}),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
