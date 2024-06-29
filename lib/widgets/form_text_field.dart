import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:password_manager/utils/color_palette.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({
    super.key,
    required this.label,
    this.keyboardType,
    this.mask,
    this.validator,
  });

  final String label;
  final TextInputType? keyboardType;
  final MaskTextInputFormatter? mask;
  final String? Function(String?)? validator;

  final BorderRadius defaultBorderRadius = const BorderRadius.all(
    Radius.circular(10),
  );

  String? _defaultValidator(String? fieldValue) {
    if (fieldValue == null || fieldValue.trim().isEmpty) {
      return "This field is required";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator ?? _defaultValidator,
      keyboardType: keyboardType ?? TextInputType.text,
      inputFormatters: mask != null ? [mask!] : [],
      cursorColor: ColorPalette.black,
      style: const TextStyle(
        color: ColorPalette.black,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(
            color: ColorPalette.labelGrey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorPalette.error,
          ),
          borderRadius: defaultBorderRadius,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorPalette.error,
            width: 2,
          ),
          borderRadius: defaultBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorPalette.labelGrey,
            width: 2,
          ),
          borderRadius: defaultBorderRadius,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorPalette.labelGrey,
          ),
          borderRadius: defaultBorderRadius,
        ),
      ),
    );
  }
}
