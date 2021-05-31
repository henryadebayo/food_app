import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/home_page.dart';

class FunAnimation extends StatefulWidget {
  @override
  _FunAnimationState createState() => _FunAnimationState();
}

class _FunAnimationState extends State<FunAnimation>
    with TickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: animationController))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reset();
          animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: animationController, curve: Curves.fastOutSlowIn))
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context) => HomePage()));
              }
            });
          animationController.forward();
        }
      });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      /* appBar: AppBar(
        title: Text("Fun Animation"),
      ), */
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return Transform(
              transform: Matrix4.translationValues(
                  animation.value * deviceWidth, 0.0, 0.0),
              child: Container(
                
                height: 200.0,
                width: 200.0,
                //child:  Text("Foodie"),
                decoration: BoxDecoration(
                  //color: Colors.blue,
 image: DecorationImage(
                          image: AssetImage("assets/images/foodie3.png"),
                         // fit: BoxFit.cover,
                        ),
                 // borderRadius: BorderRadius.circular(50.0),
                ),
              
              ),
              
            );
          },
        ),
      ),
    );
  }
}
