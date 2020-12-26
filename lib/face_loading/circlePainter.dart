import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CirclePainter extends CustomPainter {
  double lineSize;
  double offset;
  int loopCount;

  CirclePainter(
    this.lineSize,
    this.offset,
    this.loopCount,
  );

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 6;

    double extraOffset = loopCount % 2 == 1 ? size.width : 0;

    canvas.drawLine(Offset(offset, (size.height / -4) + extraOffset),
        Offset(lineSize, (size.height / -4) + extraOffset), paint);
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(lineSize, extraOffset),
        height: size.height / 2,
        width: size.width / 2,
      ),
      3 * pi / 2,
      pi,
      false,
      paint,
    );
    canvas.drawLine(Offset(lineSize, (size.height / 4) + extraOffset),
        Offset(offset, (size.width / 4) + extraOffset), paint);

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(offset, extraOffset),
        height: size.height / 2,
        width: size.width / 2,
      ),
      pi / 2,
      pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
