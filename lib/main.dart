import 'package:animations/Providers/AnimationsProviders/LightsAnimationProvider.dart';
import 'package:animations/Providers/AnimationsProviders/TVShutdownSwitchProvider.dart';
import 'package:animations/Providers/ControlProviders/BottomNavSelectionProvider.dart';
import 'package:animations/Providers/AnimationsProviders/TempController.dart';
import 'package:animations/UI/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(HomeControlApp());
}

class HomeControlApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => BottomNavSelectionProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => LightsAnimationProvider(),
          ),
          ChangeNotifierProvider(create: (context) => TempController()),
          ChangeNotifierProvider(
            create: (context) => Tvshutdownswitchprovider(),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
