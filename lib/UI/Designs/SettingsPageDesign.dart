
import 'package:flutter/material.dart';

class SettingsPageDesign extends StatelessWidget {
  final bool show;
  final double fromLeft;
  final BoxConstraints constraints;
  const SettingsPageDesign({super.key, required this.show, required this.constraints,required this.fromLeft});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                left:
                    fromLeft,
                top: 0,
                bottom: 0,
                child: Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  color: Colors.white,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.settings, color: Colors.grey[800]),
                        title: Text(
                          'Setting Item ${index + 1}',
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                      );
                    },
                    itemCount: 20,
                  ),
                ),
              );
  }
}