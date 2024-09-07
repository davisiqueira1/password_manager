import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    required this.platformName,
    required this.email,
    super.key,
  });

  final String platformName;
  final String email;
  final double diameter = 50;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: diameter,
        width: diameter,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(diameter / 2),
        ),
        child: Container(
          color: Colors.blue,
        ),
      ),
      title: Text(
        platformName,
        style: const TextStyle(
          fontSize: 20,
          color: Color(0xFF292D32),
        ),
      ),
      subtitle: Text(
        email,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF808080),
          fontWeight: FontWeight.w300,
        ),
      ),
      trailing: SvgPicture.asset("assets/images/copy.svg"),
    );
  }
}
