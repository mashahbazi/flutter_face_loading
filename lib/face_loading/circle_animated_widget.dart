import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_face_loading/face_loading/circlePainter.dart';

class CircleAnimatedWidget extends StatefulWidget {
  final double startOffset;
  final double size;
  final int durationMS;

  CircleAnimatedWidget(this.startOffset, this.size, this.durationMS);

  @override
  _CircleAnimatedState createState() => _CircleAnimatedState();
}

class _CircleAnimatedState extends State<CircleAnimatedWidget>
    with SingleTickerProviderStateMixin {
  int loopCount = 0;
  Animation<double> _sizeAnimation;
  Animation<double> _offsetAnimation;

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: widget.durationMS), vsync: this);
    _sizeAnimation = Tween<double>(begin: 0, end: widget.size).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0,
          0.5,
          curve: Curves.linear,
        ),
      ),
    );
    _sizeAnimation.addListener(() {
      setState(() {});
    });

    _offsetAnimation = Tween<double>(begin: 0, end: widget.size).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.5,
          1,
          curve: Curves.linear,
        ),
      ),
    );
    _offsetAnimation.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: (widget.durationMS * 2).toInt()))
            .then((_) {
          _controller.reverse();
          loopCount++;
        });
      } else if (status == AnimationStatus.dismissed) {
        Future.delayed(Duration(milliseconds: (widget.durationMS * 2).toInt()))
            .then((_) {
          _controller.forward();
          loopCount++;
        });
      }
    });
    Future.delayed(Duration(
            milliseconds: (widget.durationMS * widget.startOffset).toInt()))
        .then((_) => _controller.forward());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(
        angle: loopCount * 3 * pi / 2,
        child: SizedBox.fromSize(
          size: Size.square(widget.size),
          child: CustomPaint(
            painter: CirclePainter(
              _sizeAnimation.value,
              _offsetAnimation.value,
              loopCount,
            ),
          ),
        ),
      ),
    );
  }
}
