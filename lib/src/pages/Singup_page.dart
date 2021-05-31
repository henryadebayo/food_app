import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/signin_page.dart';
import 'package:flutter_app/src/scopedmodel/main_model.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email;
  String _password;
  String _confirmPassword;
  String _username;

  GlobalKey<FormState> _formkey = GlobalKey();

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 14.0,
        ),
      ),
      onSaved: (String email) {
        _email = email;
      },
      validator: (String email) {
        String errorMessage;
        if (!email.contains("@")) {
          errorMessage = "email address is incorrect";
        }
        if (email.isEmpty) {
          String errorMessage;
          errorMessage = "emailaddress is required";
        }
        return errorMessage;
      },
    );
  }

  Widget _buildUsernameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Username",
        hintStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 14.0,
        ),
      ),
      onSaved: (String username) {
        _username = username.trim();
      },
      validator: (String username) {
        String errorMessage;
        if (username.isEmpty) {
          return errorMessage = "username is required";
        }
      },
    );
  }

  bool _toggleVisibility = false;
  bool _toggleConfirmVisibility = false;

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
        ),
        obscureText: _toggleVisibility,
        onSaved: (String password) {
          _password = password;
        },
        validator: (String password) {
          String errorMessage;
          if (password.isEmpty) {
            errorMessage = "password is required";
          }
          return errorMessage;
        });
  }
  //bool _toggleVisibility = false;

 /* Widget _buildConfirmPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Confirm Password",
        hintStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 14.0,
        ),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _toggleConfirmVisibility = !_toggleConfirmVisibility;
              });
            },
            icon: Icon(OMIcons.visibilityOff)),
      ),
      obscureText: _toggleConfirmVisibility,
      onSaved: (String confirmPassword){
        _confirmPassword = confirmPassword ;
      },
     validator: ( String confirmPassword) {
          String errorMessage;
         /*  if (confirmPassword == _password){

          }else {
            errorMessage = "password is not same as first password";
          } */
          if(confirmPassword.isEmpty){
            errorMessage = "field cannot be empty";
          }
          return errorMessage;
        }
    );
  }  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/jollof_rice_(3).jpeg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Card(
                    color: Colors.white70,
                    elevation: 5.0,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          _buildEmailTextField(),
                          SizedBox(height: 20.0),
                          _buildUsernameTextField(),
                          SizedBox(height: 20.0),
                          _buildPasswordTextField(),
                          SizedBox(height: 20.0),
                          // _buildConfirmPasswordTextField(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  _buildSignUpButton(),
                  Divider(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account ?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignInPage()));
                        },
                        child: Text(
                          "Sign In",
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
      ),
    );
  }

  Widget _buildSignUpButton() {
    return ScopedModelDescendant(
        builder: (BuildContext sctx, Widget child, MainModel model) {
      return GestureDetector(
        onTap: () {
          onSubmit(model.authenticate);
        },
        child: InkWell(
         // color: Colors.white,
         onTap: (){},
                  child: Container(
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(30.0)),
            child: Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  void onSubmit(Function authenticate) {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      authenticate(_email, _password);
    }
  }
}
