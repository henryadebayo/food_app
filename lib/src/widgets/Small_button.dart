import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final String btnText;
  SmallButton({this.btnText, TextStyle style});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.0,
      width: 60.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text("$btnText"),
      ),
    );
  }
}
