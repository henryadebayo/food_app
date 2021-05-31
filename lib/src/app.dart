import 'package:flutter/material.dart';
import 'package:flutter_app/src/admin/pages/add_food_items.dart';
import 'package:flutter_app/src/scopedmodel/food_model.dart';
import 'package:flutter_app/src/screens/funanimation.dart';
import 'package:flutter_app/src/screens/main_screen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'scopedmodel/main_model.dart';
import 'screens/main_screen.dart';
import 'package:flutter_app/src/admin/pages/add_food_items.dart';



//import 'homescreen.dart';

class MyApp extends StatelessWidget{

final MainModel mainModel = MainModel();

  @override
  Widget build(BuildContext context){
    return ScopedModel<MainModel>(
      model: mainModel,
          child: MaterialApp(
          title: "Delicay",
          debugShowCheckedModeBanner:false,
          theme: ThemeData(
            primaryColor: Colors.red,
            accentColor: Colors.red[100],
            
          ),
          home: MainScreen(model: mainModel),
          //home:FunAnimation(),
      ),
    );
  }
}