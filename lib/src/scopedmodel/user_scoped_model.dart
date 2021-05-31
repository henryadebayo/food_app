import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserModel extends Model {
  User _authenticatedUser;
  void authenticate(String email, String password)  async{
    Map<String, dynamic> authData = {
      "email": email,
      "password": password,
      "returnSecureToken": true,
    };
    try {
    http.Response response =  await http.post(
          "https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=AIzaSyBuMfOMUhdtufhT96tzsupfzCsujcxcgWo",
          body: json.encode(authData),
          headers:  {'Content-Type': 'application/json' },
          );
    } catch (error) {}
  }
}
