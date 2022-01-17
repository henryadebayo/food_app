import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:flutter_app/src/pages/Singup_page.dart';
import 'package:flutter_app/src/widgets/button.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Input Email/Username",
        hintStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 14.0,
        ),
      ),
    );
  }

  bool _toggleVisibility = false;

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Input Password",
        hintStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 14.0,
        ),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _toggleVisibility = !_toggleVisibility;
              });
            },
            icon: Icon(OMIcons.visibilityOff)),
            //icon: Icon(Icons.visibility_off)),
      ),
      obscureText: _toggleVisibility,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height:MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/jollof_rice_(3).jpeg"),fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Text(
                    "Sign In",
                    style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.white70,),
                  ),
                  SizedBox(height: 100.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('Forgotten Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                          )),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Card(
                    color: Colors.white70,
                    elevation: 5.0,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          _buildEmailTextField(),
                          SizedBox(height: 20.0),
                          _buildPasswordTextField(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Button(btnText:"Sign In"),
                  Divider(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't have an account ?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (BuildContext context) => SignUpPage()));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
