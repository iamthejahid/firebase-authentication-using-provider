import "package:flutter/material.dart";
import 'package:flutter_bounce/flutter_bounce.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({
    @required this.onPressed,
    this.childText,
    this.childIcon,
    this.childTextString,
  });

  final VoidCallback onPressed;
  final bool childText;
  final String childTextString;
  final bool childIcon;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.fromLTRB(10, 5, 20, 5),
        child: Bounce(
          duration: Duration(milliseconds: 200),
          onPressed: onPressed,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF6ba7cf), Color(0xFF0675c1)]),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (childText)
                  Text(
                    childTextString ?? "ADD",
                    style: TextStyle(color: Colors.white),
                  ),
                if (childIcon) Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
          ),
        ),
      );
}
