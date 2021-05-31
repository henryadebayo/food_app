//import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/signin_page.dart';
import '../widgets/order_cart.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Food Cart", style: TextStyle( color: Colors.red ) , ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          OrderCart(),
          OrderCart(),
          OrderCart(),
          OrderCart(),
          OrderCart(),
           ],
         ),
          bottomNavigationBar: _buildTotalContainer(),
    );
  }
  Widget _buildTotalContainer(){
    return Container(
      height: 225.0,
      margin: EdgeInsets.only(top:20.0),
      padding: EdgeInsets.symmetric(horizontal:10.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Order Total", style:TextStyle(fontSize:16.0, fontWeight:FontWeight.bold, color:Colors.grey), 
              ),
              Text(
                "#2200", style:TextStyle(fontSize:16.0, fontWeight:FontWeight.bold, color:Colors.black), 
              ),
            ],

          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Discount", style:TextStyle(fontSize:16.0, fontWeight:FontWeight.bold, color:Colors.grey), 
              ),
              Text(
                "#250", style:TextStyle(fontSize:16.0, fontWeight:FontWeight.bold, color:Colors.black), 
              ),
            ],

          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Delivery Fee", style:TextStyle(fontSize:16.0, fontWeight:FontWeight.bold, color:Colors.grey), 
              ),
              Text(
                "#200", style:TextStyle(fontSize:16.0, fontWeight:FontWeight.bold, color:Colors.black), 
              ),
            ],

          ),
Divider(height: 40.0,color: Colors.redAccent,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Sub Total", style:TextStyle(fontSize:16.0, fontWeight:FontWeight.bold, color:Colors.grey), 
              ),
              Text(
                "#2250", style:TextStyle(fontSize:16.0, fontWeight:FontWeight.bold, color:Colors.black), 
              ),
            ],
          ),
          SizedBox(height:20.0),
          GestureDetector(
          onTap:(){
            Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context) => SignInPage()));
            },
          child:Container(
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(30.0),

            ),
            child: Center(
              child:
              Text(
                "Proceed to Checkout",
                style: TextStyle(color:Colors.white,
                fontWeight:FontWeight.bold,
                fontSize:18.0,
                ),
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
