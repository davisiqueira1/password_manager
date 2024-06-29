import 'package:flutter/material.dart';
import 'package:password_manager/utils/color_palette.dart';

class GetVerificationButton extends StatelessWidget {
  const GetVerificationButton({
    super.key,
    required this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPalette.black,
        disabledBackgroundColor: ColorPalette.white,
        foregroundColor: ColorPalette.white,
        disabledForegroundColor: ColorPalette.labelGrey,
        minimumSize: Size(screenWidth * 0.888, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
      ),
      child: const Text(
        "Get verification code",
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 20,
        ),
      ),
    );
  }
}
