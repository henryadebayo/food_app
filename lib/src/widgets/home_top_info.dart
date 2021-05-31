import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/eateries.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class HomeTopInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Welcome",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  )),
              Text("Yummy Delivery in minutes.",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  )),
              // Text("data")
            ],
            //Icon(Icons.notifications, size:30.0 , color: Theme.of(context).primaryColor,)
          ),
         Container(
           child:
            Column(
              children: <Widget>[
                IconButton(
                onPressed: () { 
                   // Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Eatries()));
                 },
                icon:Icon(
                  OMIcons.store,
                  size: 30.0,
                  color: Colors.redAccent,
                ), 
          ),
        Text("Eatries", style: TextStyle(color:Colors.redAccent, fontWeight:FontWeight.bold),)
              ],
            ),
         ),
        ],
      ),
    );
  }
}
