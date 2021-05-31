import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String btnText;
  final double width;
  Button({this.btnText, this.width});

  @override
  Widget build(BuildContext context) {
        return Container(
          height: 50.0,
          width: width ,
      decoration: BoxDecoration(
          color: Colors.redAccent, borderRadius: BorderRadius.circular(30.0)),
      child: Center(
        child: Text(
          "$btnText",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
