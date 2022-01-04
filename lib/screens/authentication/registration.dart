import 'package:firebase_auth_test1/common_widgets/simple_input.dart';
import 'package:firebase_auth_test1/common_widgets/submit_button.dart';
import 'package:firebase_auth_test1/services/authetication_services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Registration extends StatefulWidget {
  final Function toggleScreen;
  Registration({this.toggleScreen, key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Welcome"),
              SimpleInput(_emailController, "Email"),
              SimpleInput(
                _passwordController,
                "Password",
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              SubmitButton(
                onPressed: () async {
                  await loginProvider.registration(
                    _emailController.text.trim(),
                    _passwordController.text.trim(),
                  );
                },
                childIcon: false,
                childText: true,
                childTextString:
                    loginProvider.isLoading ? "Loading.." : "Registration",
              ),
              Row(
                children: [
                  Text("Already Have An Account?"),
                  TextButton(
                    onPressed: () => widget.toggleScreen(),
                    child: Text("Login"),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              if (loginProvider.errormessage != null)
                Container(
                  color: Colors.amberAccent,
                  child: Center(
                    child: Text(
                      loginProvider.errormessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
