import 'package:animations/UI/Designs/LightControlBoxDesign.dart';
import 'package:flutter/material.dart';

class AnimLightPageDesign extends AnimatedWidget {
  final AnimationController animationController;
  List<Animation<double>> animations = [];
  List<Color> boxesColors = [Colors.teal,Colors.amber,Colors.red,Colors.blue];

  AnimLightPageDesign({required this.animationController})
    : super(listenable: animationController) {
    animations.add(
      Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: animationController!,
          curve: Interval(0, 0.25, curve: Curves.easeInOut),
        ),
      ),
    );
    animations.add(
      Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: animationController!,
          curve: Interval(0.25, 0.5, curve: Curves.easeInOut),
        ),
      ),
    );
    animations.add(
      Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: animationController!,
          curve: Interval(0.5, 0.75, curve: Curves.easeInOut),
        ),
      ),
    );
    animations.add(
      Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: animationController!,
          curve: Interval(0.75, 1, curve: Curves.easeInOut),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 200),
        SizedBox(
          child: Center(
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 300,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return ScaleTransition(
                    scale: animations[index],
                    child: LightControlBoxDesign(color: boxesColors[index]),
                  );
                },
                itemCount: 4,
                shrinkWrap: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
