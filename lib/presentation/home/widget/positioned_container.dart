import 'package:flutter/material.dart';

class PositionedContainer extends StatelessWidget {
  const PositionedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(150),
        color: Colors.blue,
      ),
    );
  }
}
