import 'package:flutter/material.dart';

import 'Small_button.dart';

class FoodItemCard extends StatelessWidget{
  final String title;
  final String description;
  //final String category;
  final String price;
//  final String discount;

FoodItemCard(this.title, this.description, this.price);

  @override
  Widget build(BuildContext context){
    return Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              padding:  EdgeInsets.all( 10.0),
              width: MediaQuery.of(context).size.width,
              height: 150.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0,
                      offset: Offset(0, 3),
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start ,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10.0),                    width: 90.0,
                    height: 90.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/icecream_(7).jpeg"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("$title", style: TextStyle(fontSize:16.0, fontWeight:FontWeight.bold),),
                     SizedBox(height: 12.0),
                      Expanded(
                                              child: Container(
                          width: 200.0,
                           child: Text("$description")),
                      ),
                       SizedBox(height: 12.0),
                      Container(
                        //height: 50.0,
                        width: 200,
                                              child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                        Text("$price",style: TextStyle(fontSize:16.0,fontWeight:FontWeight.bold,color: Colors.blue)),
                        SmallButton(btnText:"BUY", style: TextStyle(fontSize:16.0,fontWeight:FontWeight.bold,color: Colors.blue),),
                        ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
  }
}