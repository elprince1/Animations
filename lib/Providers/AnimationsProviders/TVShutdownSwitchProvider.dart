
import 'package:flutter/material.dart';

class Tvshutdownswitchprovider extends  ChangeNotifier{
  bool isOff = false;

  void switchTvMode(){
    isOff = !isOff;
    notifyListeners();
  }
}