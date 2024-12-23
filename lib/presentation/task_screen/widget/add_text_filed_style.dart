import 'package:flutter/material.dart';

class AddTextFiledStyle extends StatelessWidget {
  const AddTextFiledStyle(
      {super.key,
      required this.addLabelText,
      required this.addFildValidator,
      required this.addTextFildController,
      required this.addMaxLines});
  final String addLabelText;
  final String? Function(String?) addFildValidator;
  final TextEditingController addTextFildController;
  final bool addMaxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: addMaxLines ? 3 : 1,
      controller: addTextFildController,
      validator: addFildValidator,
      decoration: InputDecoration(
        prefixIconColor: Colors.blue,
        label: Text(addLabelText),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
