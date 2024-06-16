import 'package:winners/shared/themes.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    required this.hint,
    this.inputType,
    this.inputAction,
    this.controller,
    required this.textarea,
  }) : super(key: key);

  final String hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextEditingController? controller;
  final bool textarea;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: textarea ? size.height * 0.2 : size.height * 0.065,
        width: size.width * 0.9,
        decoration: textarea
            ? BoxDecoration()
            : BoxDecoration(
                color: Colors.grey[500]!.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              filled: true,
              hintStyle: kBodyTextPrimary,
            ),
            style: kBodyTextPrimary,
            keyboardType: inputType,
            textInputAction: inputAction,
            controller: controller,
            maxLines: textarea ? 4 : 1,
          ),
        ),
      ),
    );
  }
}
