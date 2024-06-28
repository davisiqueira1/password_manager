import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/utils/color_palette.dart';

class CarouselPassblockItem extends StatelessWidget {
  const CarouselPassblockItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.056,
        ),
        child: Container(
          margin: EdgeInsets.only(top: screenWidth * 0.225),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/app_icon_with_shadow.svg"),
              const Text(
                "Passblock",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: ColorPalette.black,
                ),
              ),
              const Text(
                "Frictionless Security",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
