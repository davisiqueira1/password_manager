import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/utils/color_palette.dart';

class CarouselFastItem extends StatelessWidget {
  const CarouselFastItem({
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
                      "assets/images/box.svg",
                    ),
                  ),
                  SvgPicture.asset("assets/images/box.svg"),
                ],
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            const Text(
              "Fast",
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
              "Everything in a single click",
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
              "Add, generate, store, export & copy all your passwords in single click. Use autofill for quick action without opening app.",
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
