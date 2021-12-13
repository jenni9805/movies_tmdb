import 'package:flutter/foundation.dart';

class NavigationNotifier with ChangeNotifier {
  int _currentPosition = 0;

  int get currentPosition => _currentPosition;

  void change(value) {
    _currentPosition = value;
    notifyListeners();
  }
}
