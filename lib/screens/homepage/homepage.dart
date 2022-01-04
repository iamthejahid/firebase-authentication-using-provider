import 'package:firebase_auth_test1/services/authetication_services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        actions: [
          IconButton(
              onPressed: () async => await loginProvider.logOut(),
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Container(),
    );
  }
}
