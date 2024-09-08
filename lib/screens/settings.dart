import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32, top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                item("Profile", () {}),
                item("Permissions", () {}),
                item("About", () {}),
                item("Help", () {}),
                version(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox version() {
    return const SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Version",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "1.0.0",
            style: TextStyle(
              color: Color(0xFF808080),
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector item(String title, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            SvgPicture.asset("assets/images/arrow-down.svg"),
          ],
        ),
      ),
    );
  }
}
