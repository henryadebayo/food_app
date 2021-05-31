import 'dart:ui';

import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget{
final String categoryName;
final String imagePath;
final int numberOfItems;

FoodCard({this.categoryName, this.imagePath, this.numberOfItems});

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(right:20.0 ),
    child: Card(
      child:Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(children: <Widget>
      [Container
      (  
        height: 100.0,
        width: 85.0,
        decoration:BoxDecoration(
          image: DecorationImage(image:  AssetImage(imagePath),
          fit: BoxFit.cover
          ),
         borderRadius: BorderRadius.circular(15.0),
        ),
       // child: Image(image: AssetImage(imagePath),
        // fit: BoxFit.cover,
       // ),
      ),
      SizedBox(width: 30.0,),
      Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: <Widget>[
        Text(categoryName, style: TextStyle(fontWeight: FontWeight.bold, fontSize:16.0),),
        //Text("$numberOfItems Vendors")
        ],
      ),
        ],
        ),
        ),
    ),
  );
  }
}