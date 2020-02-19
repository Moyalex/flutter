import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/widgets/app_button.dart';
import 'package:flutterchat_app/src/widgets/app_icon.dart';
import 'package:flutterchat_app/src/widgets/app_textfield.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName ='/login';
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal:24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppIcon(),
            SizedBox(height: 48.0),
            AppTextField(inputText:"Ingresar Email"),
            SizedBox(height: 8.0),
            AppTextField(inputText:"Ingresar Contraseña"),
            SizedBox(height: 23.0),
            AppButton(
              color: Colors.lightBlueAccent,
              onPressed: (){Navigator.pushNamed(context, '/login');} ,
              name: "Log In",
            ), 
          ],
        )
      ),
    );  
  }
}