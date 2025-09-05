
import 'package:animations/Providers/AnimationsProviders/TVShutdownSwitchProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimTVPageDesign extends StatelessWidget{
  bool show;
  BoxConstraints constraints;
  AnimTVPageDesign({Key? key, required this.show, required this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                left:
                    show
                    ? 0
                    : -constraints.maxWidth,
                top: 0,
                bottom: 0,
                child: SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity:
                        show
                        ? 1
                        : 0,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      alignment:
                          show
                          ? Alignment.center
                          : Alignment.bottomLeft,
                      color: Colors.black.withAlpha(128),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'TV Controls',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Icon(Icons.tv, color: Colors.white, size: 100),
                          SizedBox(height: 100),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(128),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Consumer<Tvshutdownswitchprovider>(
                                  builder: (context,provider,child){
                                    return AnimatedBuilder(
                                    animation: provider,
                                    builder: (context,child){
                                      return IconButton(
                                      onPressed: () {
                                        provider.switchTvMode();
                                      },
                                      icon: AnimatedSwitcher(
                                        transitionBuilder: (child, animation) => FadeTransition(opacity:animation,child: child, ),
                                        switchInCurve: Curves.bounceInOut,
                                        duration: Duration(milliseconds: 300),
                                      child:provider.isOff? Icon(
                                        
                                        Icons.lock,
                                        key: ValueKey('1'),
                                        color: Colors.red,
                                        size: 50,
                                      ):Icon(
                                        Icons.lock_open_rounded,
                                        key: ValueKey('2'),
                                        color: Colors.red,
                                        size: 50,
                                      ),)
                                    );
                                    },
                                  );
                                  },
                                ),

                                Transform.rotate(
                                  angle: 3.14,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_drop_down_circle_outlined,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Transform.rotate(
                                      angle: 3.14 / 2,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.arrow_drop_down_circle_outlined,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Transform.rotate(
                                      angle: 3.14 / 2 * 3,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.arrow_drop_down_circle_outlined,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_drop_down_circle_outlined,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
  }
}