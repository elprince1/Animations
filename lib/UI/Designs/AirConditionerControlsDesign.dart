import 'package:animations/Providers/AnimationsProviders/TempController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AirConditionerControlsDesign extends StatelessWidget {
  bool show;
  BoxConstraints constraints;
  final double fromLeft;
  AirConditionerControlsDesign({
    super.key,
    required this.show,
    required this.constraints,
    required this.fromLeft
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<TempController>(
      builder: (context, tempProvider, child) {
        return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      left: fromLeft,
      top: 0,
      bottom: 0,
          child: Stack(
            children: [
              SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        tempProvider.color.withAlpha(128),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                left: 20,
                top: show ? 0.4 * constraints.maxHeight : constraints.maxHeight * 0.6,
                duration: Duration(milliseconds: 500),
          
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: show ? 1 : 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        IconButton(
                          iconSize: 40,
                          onPressed: tempProvider.increaseTemp,
                          icon: Icon(Icons.arrow_drop_up, color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${tempProvider.temp}°',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        IconButton(
                          iconSize: 40,
                          onPressed: tempProvider.decreaseTemp,
                          icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
