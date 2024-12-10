import 'package:flutter/material.dart';
import 'package:todo_app/presentation/core/consts/typography.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key, required this.buttonText, required this.buttonFunction});
  final String buttonText;
  final Function()? buttonFunction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonFunction,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        textStyle: AppTypography.s20w6h20,
      ),
      child: Text(buttonText),
    );
  }
}
