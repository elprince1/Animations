import 'package:flutter/material.dart';

class LightControlBoxDesign extends StatelessWidget {

  final Color color;

  const LightControlBoxDesign({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(128),
        border: Border.all(color: color, width: 2),
      ),
    );
  }
}
