import 'package:flutter/material.dart';

class PositionedPagesBgDesign extends StatelessWidget {
  BoxConstraints constraints;
  String imagePath;
  double fromLeft;
  bool show;
  PositionedPagesBgDesign({
    super.key,
    required this.constraints,
    required this.imagePath,
    required this.fromLeft,
    required this.show,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      left: fromLeft, //constraints.maxWidth
      top: 0,
      bottom: 0,
      child: Container(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        color: Colors.blueGrey,
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}