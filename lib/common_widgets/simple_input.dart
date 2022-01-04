import 'package:firebase_auth_test1/common_attributes/global_color.dart';
import 'package:flutter/material.dart';

class SimpleInput extends StatefulWidget {
  SimpleInput(this.controller, this.labelText,
      {this.formFieldKey,
      this.validator,
      this.obscureText,
      this.keyboardType,
      this.textInputAction,
      this.onChanged,
      this.isTextArea,
      this.suffixIcon = false});

  final bool obscureText;
  final TextEditingController controller;
  final String labelText;
  final GlobalKey<FormFieldState> formFieldKey;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FormFieldSetter<String> onChanged;
  final bool isTextArea;
  final bool suffixIcon;

  @override
  _SimpleInputState createState() => _SimpleInputState(obscureText);
}

class _SimpleInputState extends State<SimpleInput> {
  bool _bool;
  _SimpleInputState(this._bool);
  Color _color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: isTextArea == true ? 140 : 75,
      child: TextFormField(
        key: widget.formFieldKey,
        minLines: widget.isTextArea == true ? 5 : 1,
        maxLines: widget.isTextArea == true ? 5 : 1,
        decoration: widget.suffixIcon == true
            ? InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: _color,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        _bool = !_bool;
                        if (!_bool == true) {
                          _color = Colors.blue;
                        } else {
                          _color = Colors.grey;
                        }
                      },
                    );
                  },
                ),
                labelText: widget.labelText,
                labelStyle:
                    TextStyle(color: GlobalColor.inputHint), // Label Name
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: GlobalColor.focusedBar),
                ), // focused
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: GlobalColor.focusedBar),
                ),
              )
            : InputDecoration(
                labelText: widget.labelText,
                labelStyle:
                    TextStyle(color: GlobalColor.inputHint), // Label Name
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: GlobalColor.focusedBar),
                ), // focused
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: GlobalColor.focusedBar),
                ),
              ),
        style: TextStyle(
          color: GlobalColor.loginTitle, //Field Text
          letterSpacing: _bool == true ? 1.0 : 1.0,
        ),
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        obscureText: _bool == true ? true : false,
        controller: widget.controller,
        onChanged: widget.onChanged,
        validator: widget.validator,
        cursorColor: GlobalColor.cursorColor,
      ),
    );
  }
}
