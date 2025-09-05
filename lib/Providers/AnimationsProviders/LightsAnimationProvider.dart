import 'package:flutter/material.dart';

class LightsAnimationProvider extends ChangeNotifier {
  void forward(
    newIndex,
    currentIndex,
    AnimationController? animationController,
  ) {
    if (newIndex == 0 && currentIndex != 0) {
      animationController!.forward();
    } else if (newIndex == 0 && currentIndex == 0) {
    } else {
      animationController!.reverse();
    }
  }
}
