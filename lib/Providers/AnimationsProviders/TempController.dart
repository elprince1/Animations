
import 'package:flutter/material.dart';

class TempController extends ChangeNotifier{
  int temp=17;
  Color color = Colors.blue;

  void increaseTemp() {
    temp++;
    changeColorTemp();
    notifyListeners();
  }

  void decreaseTemp() {
    if(temp!=17){
      temp--;
    }
    changeColorTemp();
    notifyListeners();
  }

  void changeColorTemp(){
    if (temp<=25){
      color = Colors.blue;
    } else if (temp>25){
      color = Colors.red;
    }
  }

}