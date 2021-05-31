import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/food_model.dart';
import 'package:flutter_app/src/scopedmodel/main_model.dart';
import 'package:flutter_app/src/widgets/button.dart';
import 'package:flutter_app/src/widgets/show_dailog.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:scoped_model/scoped_model.dart';

class AddFoodItem extends StatefulWidget {
  final Food food;

  AddFoodItem({this.food});

  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  String name;
  String category;
  String description;
  String price;
  String discount;

  GlobalKey<FormState> _foodItemFormKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop(false);
          return Future.value(false);
        },
        child: Scaffold(
          key: _scaffoldStateKey,
          appBar: AppBar(
            title: Text(
              widget.food != null ? "Update food item" : "Add Food item",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                OMIcons.close,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.8),
              // width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height,
              child: Form(
                key: _foodItemFormKey,
                child: Column(
                  children: <Widget>[
                    Stack(alignment: Alignment.center, children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _bottomSheet(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          height: 200.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/jollof_rice_(3).jpeg"),
                                fit: BoxFit.cover,
                              ),
                              //color: Colors.blue,
                              //image: AssetImage(""),
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                      Center(
                          child: Text(
                        "Click to image",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ))
                    ]),
                    _buildTextFormField("Food Name"),
                    _buildTextFormField("Category"),
                    _buildTextFormField("Description", maxLine: 3),
                    _buildTextFormField("Price"),
                    _buildTextFormField("Discount"),
                    SizedBox(
                      height: 60.0,
                    ),
                    ScopedModelDescendant(
                      builder: (BuildContext context, Widget child,
                          MainModel model) {
                        return GestureDetector(
                            onTap: () {
                              onSubmit(model.addFood, model.updateFood);
                              if (model.isloading) {
                                //show loading progress indicator
                                showLoadingIndicator(
                                    context,
                                    widget.food != null
                                        ? "updating food item..."
                                        : "Adding Item...");
                              }
                            },
                            child: Button(
                                btnText: widget.food != null
                                    ? "Update food item"
                                    : "Add Food Items"));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSubmit(Function addFood, Function updateFood) async {
    if (_foodItemFormKey.currentState.validate()) {
      _foodItemFormKey.currentState.save();

      if (widget.food != null) {
        //update food
        Map<String, dynamic> updateFoodItem = {
          "name": name,
          "category": category,
          "description": description,
          "price": double.parse(price),
          "discount": discount != null ? double.parse(discount) : 0.0,
        };
        final bool response = await updateFood(updateFoodItem, widget.food.id);
        if (response) {
          Navigator.of(context).pop();
          Navigator.of(context).pop(response);
          SnackBar snackBar = SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Theme.of(context).primaryColor,
            content: Text(
              "Food item sucessfully updated",
              style: TextStyle(color: Colors.redAccent, fontSize: 16.0),
            ),
          );
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        } else if (!response) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Theme.of(context).primaryColor,
            content: Text(
              "Failed to update food item",
              style: TextStyle(color: Colors.redAccent, fontSize: 16.0),
            ),
          );
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        }
      } else if (widget.food == null) {
        //up
        final Food food = Food(
          name: name,
          category: category,
          description: description,
          price: double.parse(price),
          discount: double.parse(discount),
        );
        bool value = await addFood(food);
        if (value) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            content: Text("Food item sucessfully added"),
          );
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        } else if (!value) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            content: Text("Failed to add food item"),
          );
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        }
      }
    }
  }

  Widget _buildTextFormField(String hint, {int maxLine = 1}) {
    return TextFormField(
      initialValue: widget.food != null && hint == "Food Name"
          ? widget.food.name
          : widget.food != null && hint == "Description"
              ? widget.food.description
              : widget.food != null && hint == "Category"
                  ? widget.food.category
                  : widget.food != null && hint == "Price"
                      ? widget.food.price.toString()
                      : widget.food != null && hint == "Discount"
                          ? widget.food.discount.toString()
                          : '',
      decoration: InputDecoration(hintText: "$hint"),
      maxLines: maxLine,
      keyboardType: hint == "price" || hint == "Discount"
          ? TextInputType.number
          : TextInputType.text,
      validator: (String value) {
        //String
        if (value.isEmpty && hint == "Food Name") {
          return "The Food name is Requried";
        }
        if (value.isEmpty && hint == "Description") {
          return "The Description is Requried";
        }
        if (value.isEmpty && hint == "Category") {
          return "Category is Requried";
        }
        if (value.isEmpty && hint == "Price") {
          return "The Food Price is Requried";
        }
      },
      onSaved: (String value) {
        if (hint == "Food Name") {
          name = value;
        }
        if (hint == "Category") {
          category = value;
        }
        if (hint == "Description") {
          description = value;
        }
        if (hint == "Price") {
          price = value;
        }
        if (hint == "Discount") {
          discount = value;
        }
      },
    );
  }

  _bottomSheet(context) {
    showModalBottomSheet(
      backgroundColor: Colors.white70,
     // shape: ShapeBorder( ),
     //elevation: 10.0,
        context: context,
        builder: (BuildContext context) {
          return Wrap(children: <Widget>[
            Container(
                child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Upload Image From",
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold)),
              ),
              Divider(height: 10.0 ,),
              SizedBox(height: 40.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.camera,
                          color: Colors.redAccent,
                        ),
                      ),
                      Text("Gallery"),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(20),
                           color: Colors.white,
                        ),
                       
                        child: Icon(
                          Icons.image ,
                          color: Colors.redAccent,
                        ),
                      ),
                      Text("Gallery"),
                    ],
                  ),
                ],
              ),
              SizedBox(height:50),
            ])),
          ]);
        });
  }
}
