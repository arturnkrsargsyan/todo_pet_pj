import 'package:flutter/material.dart';
import 'package:todo_app/presentation/core/consts/typography.dart';
import 'package:todo_app/presentation/login/widget/clippath_clipper.dart';

class Custompainter extends StatelessWidget {
  const Custompainter({super.key, required this.appText});
  final String appText;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClippathClipper(),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        height: 300,
        alignment: Alignment.center,
        child: Text(
          appText,
          style: AppTypography.s25w6h20W,
        ),
      ),
    );
  }
}
