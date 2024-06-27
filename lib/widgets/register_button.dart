import 'package:flutter/material.dart';
import 'package:password_manager/utils/color_palette.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
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
        backgroundColor: ColorPalette.black,
        foregroundColor: ColorPalette.white,
        minimumSize: Size(screenWidth * 0.888, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
      ),
      child: const Text(
        "Register",
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 24,
        ),
      ),
    );
  }
}
