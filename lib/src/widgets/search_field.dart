import 'package:flutter/material.dart';

class SearchField extends StatelessWidget{
  final String searchTxt;

 SearchField({this.searchTxt});
  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 5.0 ,
      borderRadius: BorderRadius.circular(30.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal:30.0, vertical:14.0 ),
          hintText: "$searchTxt",
          suffixIcon: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
              ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}