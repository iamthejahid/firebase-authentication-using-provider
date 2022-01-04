import 'package:firebase_auth_test1/screens/authentication/login.dart';
import 'package:firebase_auth_test1/screens/authentication/registration.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  Authentication({Key key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool _isToggle = false;
  void toggleScreen() {
    setState(() {
      _isToggle = !_isToggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isToggle) {
      return Registration(
        toggleScreen: toggleScreen,
      );
    } else {
      return Login(toggleScreen: toggleScreen);
    }
  }
}
