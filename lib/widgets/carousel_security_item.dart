import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/utils/color_palette.dart';

class CarouselSecurityItem extends StatelessWidget {
  const CarouselSecurityItem({
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 9,
                    right: 3,
                    child: SvgPicture.asset(
                      colorFilter: const ColorFilter.linearToSrgbGamma(),
                      "assets/images/shield-tick.svg",
                    ),
                  ),
                  SvgPicture.asset("assets/images/shield-tick.svg"),
                ],
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            const Text(
              "Security",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            Container(
              height: 2,
              width: 45,
              margin: const EdgeInsets.only(
                bottom: 10,
              ),
              color: ColorPalette.black,
            ),
            const Text(
              "Control your security",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "This application is build on blockchain so that you can get 100% security across websites & applications with single app.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
