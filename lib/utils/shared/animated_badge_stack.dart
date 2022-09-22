import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// A stack that displays a red dot in a corner over its child widget
class AnimatedBadgeStack extends StatelessWidget {
  final Widget child;
  final bool isBadgeVisible;
  final double size;
  final bool repeat;
  final double right;
  final double left;
  final double top;
  final double bottom;

  AnimatedBadgeStack(
      {@required this.child,
      @required this.isBadgeVisible,
      this.size = 15,
      this.repeat = false,
      this.right,
      this.left,
      this.top,
      this.bottom});

  @override
  Widget build(BuildContext context) {
    final webSize = size * .7;

    return Stack(children: [
      child,
      if (isBadgeVisible && kIsWeb)
        Positioned(
            right: right,
            left: left,
            top: top,
            bottom: bottom,
            child: Container(
              width: webSize + 1,
              height: webSize + 1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7.0)),
            )),
      isBadgeVisible
          ? Positioned(
              right: right,
              left: left,
              top: top,
              bottom: bottom,
              child: kIsWeb
                  ? Container(
                      width: webSize,
                      height: webSize,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(7.0)),
                    )
                  : Lottie.asset(
                      'assets/learn/learndot.json',
                      height: size,
                      repeat: repeat,
                    ))
          : Container(width: 0, height: 0)
    ]);
  }
}
