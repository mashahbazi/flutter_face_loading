import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_face_loading/face_loading/circle_animated_widget.dart';

class FaceLoadingWidget extends StatelessWidget {
  final double size;
  final int durationMS;

  FaceLoadingWidget(this.size, this.durationMS);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAnimatedWidget(0, size, durationMS),
        Transform.rotate(
          angle: pi,
          child: CircleAnimatedWidget(2, size, durationMS),
        ),
        Transform.rotate(
          angle: 3 * pi / 2,
          child: CircleAnimatedWidget(1, size, durationMS),
        ),
      ],
    );
  }
}
