import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/food_details_page.dart';
import 'package:flutter_app/src/scopedmodel/food_model.dart';
import 'package:flutter_app/src/scopedmodel/main_model.dart';
import 'package:flutter_app/src/widgets/food_category.dart';
import 'package:flutter_app/src/widgets/bought_foods.dart';
import 'package:scoped_model/scoped_model.dart';
import '../widgets/home_top_info.dart';
import '../widgets/food_category.dart';
import '../widgets/search_field.dart';
//data
import '../data/food_data.dart';
import '../models/food_model.dart';
import '../scopedmodel/food_model.dart';

class HomePage extends StatefulWidget {
  //final FoodModel foodModel;

  //HomePage(this.foodModel);

  @override
  _HomePageState CreateState() => _HomePageState();

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<Food> _foods = foods;

  @override
  void initState() {
    // widget.foodModel.fetchfoods();
    super.initState();
  }

  //List<Food> _foods = foods;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
          children: <Widget>[
            HomeTopInfo(),
           FoodCategory(),
            SizedBox(height: 10.0),
            SearchField(searchTxt: "search Foods"),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Frequently Bought Food",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0),
            ScopedModelDescendant<MainModel>(
              builder: (BuildContext context, Widget child, MainModel model) {
                return Column(
                  children: model.foods.map(_buildFoodItems).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodItems(Food food) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => FoodDetailsPage(
               food = food, 
            )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: BoughtFoods(
          id: food.id,
          name: food.name,
          imagePath: "assets/images/jollof_rice_.jpeg",
          category: food.category,
          discount: food.discount,
          price: food.price,
          ratings: food.ratings,
        ),
      ),
    );
  }
}
