import 'package:firebase_auth_test1/screens/wrapper.dart';
import 'package:firebase_auth_test1/services/authetication_services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _init = Firebase.initializeApp();
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MaterialApp(
            home: ErrorWidget(),
          );
        } else if (snapshot.hasData) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<AuthServices>.value(value: AuthServices()),
              StreamProvider<User>.value(
                value: AuthServices().user,
                initialData: null,
              )
            ],
            child: MaterialApp(
              home: Wrapper(),
            ),
          );
        } else {
          return MaterialApp(
            home: Loading(),
          );
        }
      },
    );
  }
}

class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            children: [
              Icon(Icons.error),
              Text("Something Went Wrong"),
            ],
          ),
        ),
      );
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            children: [
              Icon(Icons.edit_attributes),
              Text("Loading.."),
            ],
          ),
        ),
      );
}
