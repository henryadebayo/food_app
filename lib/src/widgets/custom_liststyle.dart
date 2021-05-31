import 'package:flutter/material.dart';

class ConstomListTile extends StatelessWidget {
  final IconData icon;
  final String text;

ConstomListTile({this.icon, this.text });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.orange,
          ),
          SizedBox(width: 15.0),
          Text(
            "$text",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
