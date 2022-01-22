import 'dart:core';
import 'package:flutter_app/src/admin/pages/add_food_items.dart';
import 'package:flutter_app/src/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodModel extends Model {
  List<Food> _foods = [];
  bool _isloading = false;

  bool get isloading {
    return _isloading;
  }

  List<Food> get foods {
    return List.from(_foods);
  }

  int get foodLenght {
    return _foods.length;
  }

  // get foodItems => null;
  Future<bool> addFood(Food food) async {
    _isloading = true;
    notifyListeners();
    //_foods.add(food);
    //  void addFood(Food food) async
    try {
      final Map<String, dynamic> foodData = {
        "name": food.name,
        "description": food.description,
        "category": food.category,
        "price": food.price,
        "discount": food.discount,
      };
      final http.Response response = await http.post(
          "https://foodie2-86668.firebaseio.com/foods.json",
          body: json.encode(foodData));
      final Map<String, dynamic> responseData = json.decode(response.body);

      Food foodWithID = Food(
        id: responseData["name"],
        name: food.name,
        description: food.description,
        category: food.category,
        price: food.price,
        discount: food.discount,
      );

      _foods.add(foodWithID);
      _isloading = false;
      notifyListeners();
      return Future.value(true);
    } catch (e) {
      _isloading = false;
      notifyListeners();
      return Future.value(false);
      print("Connection error: $e");
    }
  }

  Future<bool> fetchfoods() async {
    _isloading = true;
    notifyListeners();
    try {
      final http.Response response =
          
          
          await http.get("https://foodie2-86668.firebaseio.com/foods.json");

      List<Food> _foodItems = [];


      final Map<String, dynamic> fetchedData = json.decode(response.body);

      fetchedData.forEach((String id, dynamic foodData) {
        Food foodItem = Food(
          id: id,
          name: foodData["name"],
          description: foodData["description"],
          category: foodData["category"],
          price: double.parse(foodData["price"].toString()),
          discount: double.parse(foodData["discount"].toString()),
          //ratings: foodData["price"],
        );
        _foodItems.add(foodItem);
      });

      _foods = _foodItems;
      _isloading = false;
      notifyListeners();
      return Future.value(true);
    } catch (error) {
      _isloading = false;
      notifyListeners();
      return Future.value(false);
    }
  }

  Future<bool> updateFood(Map<String, dynamic> foodData, String foodId) async {
    _isloading = true;
    notifyListeners();
//getv food by id
    Food thefood = getFoodItemById(foodId);
    //get food by index
    int foodIndex = foods.indexOf(thefood);
    try {
      await http.put("https://foodie2-86668.firebaseio.com/foods/$foodId.json",
          body: json.encode(foodData));
        Food updatedFoodItem = Food(
          id: foodId,
          name: foodData["name"],
          category: foodData["category"],
          discount: foodData["discount"],
          price: foodData['price'],
          description: foodData['description'],
        );
        _foods[foodIndex] = updatedFoodItem;
        _isloading = false;
        notifyListeners();
        return Future.value(true);

    } catch (error) {
      _isloading = false;
      notifyListeners();
      return Future.value(false);
    }
  }

  Future<bool> deleteFood(String foodId)async{
    _isloading = true;
    notifyListeners();
    try{
         await http.delete("https://foodie2-86668.firebaseio.com/foods/$foodId.json");

_foods.removeWhere((Food food) => food.id == foodId);


_isloading = false;
notifyListeners();
return Future.value(true);
    }catch(error){
_isloading = false;
notifyListeners();
return Future.value(false);
    }
  }

   Food getFoodItemById(String foodId){
     Food food;
     for(int i =0; i < _foods.length; i++){
       if(_foods[i].id == foodId ){
         food = _foods[i];
         break;
       }
     }
     return food;
   }
}
