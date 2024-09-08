import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/controllers/new_record_controller.dart';

class NewRecordScreen extends GetView<NewRecordController> {
  const NewRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Stack(
            children: [
              InkWell(
                onTap: () => Get.back(closeOverlays: true),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  height: 50,
                  child: SvgPicture.asset("assets/images/arrow-left.svg"),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "New Record",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 30),
            child: Column(
              children: <Widget>[
                _formItem(
                  "Name",
                  "website or app name",
                ),
                const SizedBox(height: 10),
                _formItem(
                  "Login",
                  "username or email",
                ),
                const SizedBox(height: 25),
                const Divider(
                  color: Color(0xFADADADA),
                  thickness: 2,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF292D32),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                _passwordField(screenWidth - 48),
                const SizedBox(height: 20),
                _passwordLengthSlider(),
                const SizedBox(height: 15),
                _passwordCheckBoxes(),
                const SizedBox(height: 40),
                Row(
                  children: <Widget>[
                    Expanded(child: _button("Regenerate")),
                    const SizedBox(width: 20),
                    Expanded(child: _button("Save password")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextButton _button(String label) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            width: 1,
            color: Color(0xFFDADADA),
          ),
        ),
        overlayColor: Colors.black,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF333333),
          ),
        ),
      ),
    );
  }

  Row _passwordLengthSlider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text(
          "Length",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Row(
          children: [
            Container(
              width: 35,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color(0xFFDADADA),
                ),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "30",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            Slider(
              onChanged: (double v) {},
              min: 5,
              value: 15,
              max: 30,
              divisions: 30,
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }

  GridView _passwordCheckBoxes() {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 4,
      shrinkWrap: true,
      crossAxisSpacing: 15,
      mainAxisSpacing: 10,
      children: List.generate(
        4,
        (index) {
          const Map<int, String> settings = {
            0: "Numbers",
            1: "Symbols",
            2: "Lowercase",
            3: "Uppercase",
          };
          return Row(
            children: [
              Expanded(
                child: Text(
                  settings[index]!,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: false,
                  onChanged: (bool? value) {},
                  checkColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side: const BorderSide(
                    width: 1.5,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Column _passwordField(double screenWidth) {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: const Color(0xFFDADADA),
            ),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(5),
            ),
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 50.0,
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "ZjNWrxpBnytj",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF808080),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 12),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset("assets/images/refresh.svg"),
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 5,
              decoration: const BoxDecoration(
                color: Color(0xFFDADADA),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(5),
                ),
              ),
            ),
            Container(
              width: screenWidth, // it will be multiplied by some [0:1] value
              height: 5,
              decoration: const BoxDecoration(
                color: Color(0xFF1ED760),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(5),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Row _formItem(String title, String fieldLabel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              hintText: fieldLabel,
              hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Color(0xFF808080),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
