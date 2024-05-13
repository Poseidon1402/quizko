import 'package:flutter/material.dart';

import '../../../../core/utils/colors/app_color.dart';

class HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [AppColor.purple3, AppColor.blue2],
        begin: Alignment.center,
        end: Alignment.bottomLeft,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    Path path = Path();

    path = Path();
    path.lineTo(0, 0);
    path.cubicTo(0, 0, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width, size.height * 0.86, size.width,
        size.height * 0.86);
    path.cubicTo(size.width, size.height * 0.86, size.width, size.height * 0.86,
        size.width, size.height * 0.86);
    path.cubicTo(size.width * 0.68, size.height * 1.05, size.width * 0.32,
        size.height * 1.05, 0, size.height * 0.86);
    path.cubicTo(
        0, size.height * 0.86, 0, size.height * 0.86, 0, size.height * 0.86);
    path.cubicTo(0, size.height * 0.86, 0, 0, 0, 0);
    path.cubicTo(0, 0, 0, 0, 0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
