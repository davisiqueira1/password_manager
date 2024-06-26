import 'package:flutter/material.dart';
import 'package:password_manager/utils/color_palette.dart';

class ButtonToLogin extends StatelessWidget {
  const ButtonToLogin({
    super.key,
    required this.screenWidth,
    required this.onPressed,
  });

  final double screenWidth;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPalette.white,
        foregroundColor: ColorPalette.black,
        minimumSize: Size(screenWidth * 0.888, 55),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: ColorPalette.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
      ),
      child: const Text(
        "Already have an account",
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 20,
        ),
      ),
    );
  }
}
