import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginNotifier with ChangeNotifier {
  bool _loggedIn = false;

  bool islLogged() => _loggedIn;

  void login() {
    _loggedIn = true;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    notifyListeners();
  }
}
