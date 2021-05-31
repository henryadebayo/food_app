import 'package:flutter/material.dart';
import 'package:flutter_app/src/admin/pages/add_food_items.dart';
import 'package:flutter_app/src/data/food_data.dart';
import 'package:flutter_app/src/models/food_model.dart';
import 'package:flutter_app/src/scopedmodel/main_model.dart';
import 'package:flutter_app/src/widgets/Small_button.dart';
import 'package:flutter_app/src/widgets/food_item_card.dart';
import 'package:flutter_app/src/widgets/show_dailog.dart';
import 'package:scoped_model/scoped_model.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  GlobalKey<ScaffoldState> _explorePageScaffoldKey = GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
      key: _explorePageScaffoldKey,
      backgroundColor: Colors.white,
      body: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          // model.fetchfoods();
          //List<Food> foods = model.foods;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: RefreshIndicator(
              onRefresh: model.fetchfoods,
              child: ListView.builder(
                itemCount: model.foodLenght,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async {
                      final bool response =
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => AddFoodItem(
                                    food: model.foods[index],
                                  )));
                      if (response) {
                        SnackBar snackBar = SnackBar(
                          duration: Duration(seconds: 2),
                          backgroundColor: Theme.of(context).primaryColor,
                          content: Text(
                            "Food item sucessfully updated",
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 16.0),
                          ),
                        );
                        _explorePageScaffoldKey.currentState
                            .showSnackBar(snackBar);
                      }
                    },
                    onLongPress: (){
                      //delete food item 
                      showLoadingIndicator(context,"Deleting food item..." );
                      model.deleteFood(model.foods[index].id).then((bool response) => Navigator.of(context).pop(),
                      );
                    },
                    child: FoodItemCard(
                      model.foods[index].name,
                      model.foods[index].description,
                      model.foods[index].price.toString(),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
