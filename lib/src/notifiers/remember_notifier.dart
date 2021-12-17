import 'package:flutter/material.dart';

class RememberNotifier with ChangeNotifier{
  bool _isCheck = false;

  bool isCheck() => _isCheck;

  void isChecked(){
    _isCheck = true;
    notifyListeners();
  }
  void isNotChecked(){
    _isCheck = false;
    notifyListeners();
  }
}