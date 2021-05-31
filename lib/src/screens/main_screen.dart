import 'package:flutter/material.dart';
import 'package:flutter_app/src/admin/pages/add_food_items.dart';
import 'package:flutter_app/src/admin/pages/add_resturants.dart';
import 'package:flutter_app/src/pages/eateries.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import '../pages/home_page.dart';
import '../pages/order_page.dart';
import '../pages/explore.dart';
import '../pages/profile_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../scopedmodel/main_model.dart';

class MainScreen extends StatefulWidget {
  final MainModel model;

  MainScreen({this.model});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;
  List<Widget> pages;
  Widget currentPage;

  HomePage homePage;
  OrderPage orderPage;
  Explore explore;
  Profile profile;
  //Eatries eatries;

  @override
  void initState() {
    // widget.foodModel.fetchfoods();
    widget.model.fetchfoods();

    super.initState();
    homePage = HomePage();
    orderPage = OrderPage();
    explore = Explore();
    profile = Profile();

    pages = [homePage, explore, orderPage, profile];

    currentPage = homePage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text(
          'Delicacy',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              OMIcons.notifications,
              size: 25.0,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: _buildShoppingCart(),
            onPressed: () {},
          ),
        ],
        elevation: 7.0,
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AddFoodItem()));
                },
                child: ListTile(
                  title: Text(
                    "Add Food Item",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                  leading: Icon(
                    OMIcons.addCircle,
                    color: Colors.red[900],
                  ),
                  //subtitle: Text("Add Eateries"),
                  trailing: Icon(OMIcons.fastfood, color: Colors.red[900]),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Add_Resturants()));
                },
                child: ListTile(
                  leading: Icon(
                    OMIcons.addCircle,
                    color: Colors.red[900],
                  ),
                  title: Text(
                    "Add Eateries",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                  trailing: Icon(OMIcons.restaurant, color: Colors.red[900]),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          color: Colors.white70,
          backgroundColor: Colors.red[300],
          //buttonBackgroundColor: Colors.red,
          height: 48,
          items: <Widget>[
            Icon(OMIcons.home, color: Colors.red[900]),
            Icon(OMIcons.favorite, color: Colors.red[900]),
            Icon(
              OMIcons.shoppingCart,
              color: Colors.red[900],
            ),
            Icon(OMIcons.person, color: Colors.red[900]),
          ],
          animationDuration: Duration(
            milliseconds: 500,
          ),
          index: 0,
          animationCurve: Curves.bounceInOut,
          onTap: (index) {
            setState(() {
              currentTabIndex = index;
              currentPage = pages[index];
            });
          }),
      body: currentPage,
    );
  }

  Widget _buildShoppingCart() {
    return Stack(
      children: <Widget>[
        Icon(
          OMIcons.shoppingCart,
          size: 25.0,
          color: Colors.white,
        ),
        Positioned(
          right: 0.0,
          top: -0.1,
          child: Container(
            height: 13.0,
            width: 13.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.5),
              color: Colors.red[900],
            ),
            child: Center(
              child: Text("12",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 9.0)),
            ),
          ),
        ),
      ],
    );
  }
}
/* 
BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
              currentPage = pages[index];
            });
          },
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(OMIcons.home),
              title: Text("Home"),
            ),
             BottomNavigationBarItem(
              icon: Icon(OMIcons.explore),
              title: Text("Explore"),
            ),
            BottomNavigationBarItem(
              icon: Icon(OMIcons.shoppingCart),
              title: Text("Orders"),
            ),
            BottomNavigationBarItem(
              icon: Icon(OMIcons.person),
              title: Text("Profile"),
            ),
          ],
        ), */
