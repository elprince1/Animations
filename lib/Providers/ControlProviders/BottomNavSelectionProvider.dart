
import 'package:flutter/material.dart';

class BottomNavSelectionProvider extends ChangeNotifier{
  int selectedIndex = 0;
  List<double> pagesfromLeft = [0,1,2,3];

  void updateSelectedIndex(int index){
    selectedIndex = index;
    if(index==0){
      pagesfromLeft = [0,1,2,3];
    }else if(index==1){
      pagesfromLeft = [-1,0,1,2];
    }else if(index==2){
      pagesfromLeft = [-2,-1,0,1];
    }else{
      pagesfromLeft = [-3,-2,-1,0];
    }
    notifyListeners();
  }
}