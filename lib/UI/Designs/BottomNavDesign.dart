
import 'package:animations/Providers/AnimationsProviders/LightsAnimationProvider.dart';
import 'package:animations/Providers/ControlProviders/BottomNavSelectionProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavDesign extends StatelessWidget{

  AnimationController animationController;
  BottomNavDesign({required this.animationController});
  List<BottomNavigationBarItem> navigationBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.lightbulb), label: 'Lights'),
    BottomNavigationBarItem(
      icon: Icon(Icons.ac_unit),
      label: 'Air Conditioner',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.teal),

        child: Builder(
          builder: (context) {
            return Consumer<BottomNavSelectionProvider>(
              builder: (context, bottomNavSelectionProvider, child) {
                return BottomNavigationBar(
                  showUnselectedLabels: true,
                  currentIndex: bottomNavSelectionProvider.selectedIndex,
                  selectedItemColor: Colors.amber,
                  unselectedItemColor: Colors.white,
                  unselectedLabelStyle: TextStyle(color: Colors.white),
                  onTap: (index) {
                    context.read<LightsAnimationProvider>().forward(
                      index,
                      bottomNavSelectionProvider.selectedIndex,
                      animationController,
                    );
                    bottomNavSelectionProvider.updateSelectedIndex(index);
                  },
                  items: navigationBarItems,
                );
              },
            );
          },
        ),
      );
  }
}