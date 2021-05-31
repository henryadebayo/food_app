import 'package:flutter/material.dart';

class EateriesCard extends StatelessWidget {

final String resName;
final String resLocation;
final double    rating;
final  bool    status;
final String    imagePath;

EateriesCard({Key key, this.resName, this.resLocation, this.rating, this.status, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
               Container(
                  margin: EdgeInsets.only(right:20.0 ),
      child: Card(
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(children: <Widget>
        [Image(image: AssetImage(imagePath),
        height: 100.0,
        width: 100.0,
        fit: BoxFit.cover,
        ),
        SizedBox(width: 50.0,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: <Widget>[
          Text(resName, style: TextStyle(fontWeight: FontWeight.bold, fontSize:16.0),),
          //Text("$numberOfItems Vendors")
          ],
        ),
          ],
          ),
          ),
      ),
                ),   
            ],
          ),
        ],
      ),
    );
  }
}