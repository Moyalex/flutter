import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/screens/registration_screen.dart';
import 'package:flutterchat_app/src/screens/welcome_screem.dart';
import 'package:flutterchat_app/src/screens/login_screen.dart';

void main() {
  runApp(new MaterialApp(
   home: WelcomeScreen(),
   theme: ThemeData(
     textTheme: TextTheme(
       body1: TextStyle(
         color: Colors.black45
       )
     ),
   ),
   initialRoute: WelcomeScreen.routeName,
   routes: <String,WidgetBuilder>{
     LoginScreen.routeName: (BuildContext context)=>LoginScreen(),
     WelcomeScreen.routeName: (BuildContext context)=>WelcomeScreen(),
     RegistrationScreen.routeName:(BuildContext context)=>RegistrationScreen(),
   },
  ));
}