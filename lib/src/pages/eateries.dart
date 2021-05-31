import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/search_field.dart';


class Eatries extends StatefulWidget {
  @override
  _EatriesState createState() => _EatriesState();
}

class _EatriesState extends State<Eatries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   appBar: AppBar(title:Text("data")),
      body:  ListView(
           padding: EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
            children: <Widget>[
              SizedBox(height: 20.0,), 
          SearchField(
            searchTxt: "Search Eateries/Resturants"
          ),
            ],
         ),
    );
  }
}
