import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import '../widgets/custom_liststyle.dart';
import '../widgets/Small_button.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

@override
bool turnOnNotification = false;
bool turnOnLocation = false;

class _ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Profile",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0)),
                    height: 110.0,
                    width: 110.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/DSC_3958.JPG"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(55.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 2.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Marvel Henry",
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "+2349076429601",
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      InkWell(
                        //focusColor: Colors.orange,
                        child: SmallButton(btnText:"Edit")),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Text(
                "Account",
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      ConstomListTile(
                          icon: OMIcons.locationOn, text: "Location"),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                        indent: 16.0,
                      ),
                      ConstomListTile(
                          icon: OMIcons.visibility, text: "Change Password"),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                        indent: 10.0,
                      ),
                      ConstomListTile(
                          icon: OMIcons.shoppingCart, text: "Shipping"),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                        indent: 10.0,
                      ),
                      ConstomListTile(icon: OMIcons.payment, text: "Payment"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "Notification",
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "App Notification",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          Switch(
                            value: turnOnNotification,
                            onChanged: (bool value) {
                              //turnOnNotification = value;
                              setState(() {
                                turnOnNotification = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                        indent: 16.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Location Tracking",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          Switch(
                            value: turnOnLocation,
                            onChanged: (bool value) {
                              //turnOnNotification = value;
                              setState(() {
                                turnOnLocation = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                        indent: 16.0,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "Other",
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //SizedBox(width: 15.0),
                        Text(
                          "Language",
                          style: TextStyle(
                            fontSize:  16.0,
                          ),
                        ),
                        Divider(
                        height: 30.0,
                        color: Colors.grey,
                        indent: 16.0,
                      ),
                       Text(
                          "Currency",
                          style: TextStyle(
                            fontSize:  16.0,
                          ),
                        ),
                         Divider(
                        height: 30.0,
                        color: Colors.grey,
                        indent: 16.0,
                      ),
                       
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Text(
                "Marvel 2020",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
