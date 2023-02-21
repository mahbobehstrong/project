import 'package:flutter/material.dart';

class LoginController{

  String email="";
  String password="";
  final formKey=GlobalKey<FormState>();

  login(){
    print("start login method");

   if(formKey.currentState!.validate()){
     formKey.currentState!.save();
     print("$email    $password");
   }
  }

}