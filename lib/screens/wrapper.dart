import 'package:firebase_auth_test1/screens/authentication/authenticaion.dart';
import 'package:firebase_auth_test1/screens/homepage/homepage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget {
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user != null) {
      return HomePage();
    } else {
      return Authentication();
    }
  }
}
