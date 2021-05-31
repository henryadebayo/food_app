import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/resturants_model.dart';
import 'package:flutter_app/src/scopedmodel/main_model.dart';
import 'package:flutter_app/src/widgets/button.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:scoped_model/scoped_model.dart';

class Add_Resturants extends StatefulWidget {
  final Resturants resturants;

  const Add_Resturants({this.resturants});

  @override
  _Add_ResturantsState createState() => _Add_ResturantsState();
}

class _Add_ResturantsState extends State<Add_Resturants> {
  String resName;
  String resLocation;
  String hint;
  GlobalKey<FormState> _resKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop(false);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: null,
            centerTitle: true,
            title: Text(
              "Add Resturants",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.8, vertical: 20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    height: 200.0,
                    decoration: BoxDecoration(
                        color: Colors.redAccent[100],
                        borderRadius: BorderRadius.circular(10.0)),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Icon(
                      OMIcons.cameraAlt,
                      color: Colors.white60,
                      size: 100.0,
                    )),
                  ),
                  Form(
                      key: _resKey,
                      child: Column(
                        children: <Widget>[
                          _buildTextFormFeild("Name of Resturant"),
                          _buildTextFormFeild("Res. location"),
                          _buildTextFormFeild("hint", maxlines: 3),
                        ],
                      )),
                  SizedBox(height: 150.0),
                  ScopedModelDescendant(builder:
                      (BuildContext context, Widget child, MainModel model) {
                    return GestureDetector(
                        onTap: () {
                          if (_resKey.currentState.validate()) {
                            _resKey.currentState.save();

                            Resturants(
                              resName: resName,
                              resLocation: resLocation,
                            );
                          }
                        },
                        child: Button(btnText: " Add Res"));
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormFeild(String hint, {int maxlines}) {
    return TextFormField(
      decoration: InputDecoration(hintText: "$hint"),
      maxLines: maxlines,
      validator: (String value) {
        if (value.isEmpty && hint == "Name of Resturant") {
          return "The Res name is Requried";
        }
        if (value.isEmpty && hint == "Res. location") {
          return "The Res location is Requried";
        }
        if (value.isEmpty && hint == "hint") {
          return "The Res hint is Requried";
        }
        onChanged:
        (String value) {
          if (hint == "Name of Resturant") {
            resName = value;
          }
          if (hint == "Res. location") {
            resName = value;
          }
          if (hint == "hint") {
            resName = value;
          }
        };
      },
    );
  }
}
