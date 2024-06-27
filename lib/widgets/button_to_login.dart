import 'package:flutter/material.dart';
import 'package:password_manager/utils/color_palette.dart';

class ButtonToLogin extends StatelessWidget {
  const ButtonToLogin({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
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
