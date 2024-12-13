import 'package:flutter/material.dart';

class ChildpathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.lineTo(0, 100);
    path.lineTo(0, h);
    path.quadraticBezierTo(
      w * 0.4,
      h - 100,
      w,
      h - 20,
    );
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
