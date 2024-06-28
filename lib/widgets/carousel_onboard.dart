import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/utils/color_palette.dart';
import 'package:password_manager/widgets/carousel_fast_item.dart';
import 'package:password_manager/widgets/carousel_passblock_item.dart';
import 'package:password_manager/widgets/carousel_security_item.dart';

class CarouselOnboard extends StatefulWidget {
  const CarouselOnboard({
    super.key,
  });

  @override
  State<CarouselOnboard> createState() => _CarouselOnboardState();
}

class _CarouselOnboardState extends State<CarouselOnboard> {
  int _currentItem = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final List<Widget> items = [
      const CarouselSecurityItem(),
      const CarouselFastItem(),
      const CarouselPassblockItem(),
    ];
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.asMap().entries.map((entry) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: 10,
              width: 100,
              decoration: BoxDecoration(
                color: _currentItem == entry.key
                    ? ColorPalette.black
                    : ColorPalette.white,
                border: Border.all(
                  color: ColorPalette.black,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            );
          }).toList(),
        ),
        CarouselSlider(
          items: items,
          options: CarouselOptions(
            height: screenHeight * 0.75,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            onPageChanged: (index, reason) {
              setState(() {
                _currentItem = index;
              });
            },
          ),
        ),
      ],
    );
  }
}
