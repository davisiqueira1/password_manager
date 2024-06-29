import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/utils/color_palette.dart';

class CodeField extends StatelessWidget {
  const CodeField({
    super.key,
    this.lastField = false,
  });

  final bool lastField;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorPalette.labelGrey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: "",
        ),
        textInputAction:
            lastField ? TextInputAction.done : TextInputAction.next,
        cursorColor: ColorPalette.black,
        validator: (value) => value != null && value.isEmpty ? "" : null,
      ),
    );
  }
}
