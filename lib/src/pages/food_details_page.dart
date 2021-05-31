import 'package:flutter/material.dart';
import 'package:flutter_app/src/admin/pages/add_food_items.dart';
import 'package:flutter_app/src/models/food_model.dart';
import 'package:flutter_app/src/widgets/button.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class FoodDetailsPage extends StatelessWidget {
  final Food food;

  FoodDetailsPage([this.food]);

  var _mediumSpace = SizedBox(
    height: 20.0,
  );
  var _largeSpace = SizedBox(
    height: 40.0,
  );

  var _smallSpace = SizedBox(
    height: 10.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 10.0,
        title: Text(
          "Food Details",
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/jollof_rice_(3).jpeg",
                  fit: BoxFit.cover,
                ),
              ),
              _mediumSpace,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      food.name,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      food.price.toString(),
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    _mediumSpace,
                    Text(
                      "Description",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    _smallSpace,
                    Text(
                      food.description,
                      textAlign: TextAlign.justify,
                    ),
                    _mediumSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.add_circle), onPressed: null),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          "1",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        IconButton(
                            icon: Icon(Icons.remove_circle), onPressed: null),
                      ],
                    ),
                    _largeSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AddFoodItem()));
                          },
                          child: Button(
                            width: 180.0,
                            btnText: "Add to cart",
                          ),
                        ),
                        // SizedBox(width: 50.0,),
                        Button(
                          width: 180.0,
                          btnText: "Buy Now",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    /*   Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: ,
      decoration: BoxDecoration(
          color: Colors.redAccent, borderRadius: BorderRadius.circular(30.0)),
      child: Center(
        child: Text(
          "$btnText",
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  } */
  }
}
