import 'package:flutter/material.dart';

class TextFieldStyle extends StatelessWidget {
  const TextFieldStyle(
      {super.key,
      required this.labelText,
      required this.prefixIconAdd,
      required this.fildValidator,
      required this.textFildController});
  final String labelText;
  final Icon prefixIconAdd;
  final String? Function(String?) fildValidator;
  final TextEditingController textFildController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFildController,
      validator: fildValidator,
      decoration: InputDecoration(
        prefixIconColor: Colors.blue,
        label: Text(labelText),
        prefixIcon: prefixIconAdd,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
