import 'package:animations/Providers/AnimationsProviders/LightsAnimationProvider.dart';
import 'package:animations/Providers/ControlProviders/BottomNavSelectionProvider.dart';
import 'package:animations/Providers/AnimationsProviders/TempController.dart';
import 'package:animations/UI/Designs/AirConditionerControlsDesign.dart';
import 'package:animations/UI/Designs/AnimLightPageDesign.dart';
import 'package:animations/UI/Designs/AnimTvPageDesign.dart';
import 'package:animations/UI/Designs/BottomNavDesign.dart';
import 'package:animations/UI/Designs/LightControlBoxDesign.dart';
import 'package:animations/UI/Designs/PositionedPageDesign.dart';
import 'package:animations/UI/Designs/SettingsPageDesign.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;


  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );

    animationController!.forward();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavDesign(animationController: animationController!),
      body: SizedBox(
        height: double.infinity,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Consumer<BottomNavSelectionProvider>(
              builder: (context,bottomNavProvider,child) {
                return Stack(
                  children: [
                    // Home Lights
                    PositionedPagesBgDesign(constraints: constraints, imagePath: 'assets/images/home3.jpg',fromLeft: bottomNavProvider.pagesfromLeft[0]*constraints.maxWidth,show: bottomNavProvider.selectedIndex == 0,),
                    
                
                    // Air Conditioner
                    PositionedPagesBgDesign(constraints: constraints, imagePath: 'assets/images/Conditioner.jpg', fromLeft: bottomNavProvider.pagesfromLeft[1]*constraints.maxWidth,show: bottomNavProvider.selectedIndex == 1,),
                
                    // TV
                    PositionedPagesBgDesign(constraints: constraints, imagePath: 'assets/images/TV2.jpg', fromLeft: bottomNavProvider.pagesfromLeft[2]*constraints.maxWidth,show: bottomNavProvider.selectedIndex == 2,),              
                    // settings
                    SettingsPageDesign(show: bottomNavProvider.selectedIndex == 3, constraints: constraints,fromLeft:bottomNavProvider.pagesfromLeft[3]*constraints.maxWidth),
                    
                    AnimLightPageDesign(animationController: animationController!),
                    
                    AirConditionerControlsDesign(show: bottomNavProvider.selectedIndex == 1, constraints: constraints,fromLeft: bottomNavProvider.pagesfromLeft[1]*constraints.maxWidth,),
        
                    AnimTVPageDesign(show: bottomNavProvider.selectedIndex == 2, constraints: constraints),
        
                  ],
                );
              }
            );
          },
        ),
      ),
    );
  }
}


