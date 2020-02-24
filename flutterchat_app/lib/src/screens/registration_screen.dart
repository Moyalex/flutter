import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/widgets/app_button.dart';
import 'package:flutterchat_app/src/widgets/app_icon.dart';
import 'package:flutterchat_app/src/widgets/app_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
static const String routeName='/registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final auth = FirebaseAuth.instance;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        padding: EdgeInsets.symmetric(horizontal:24.0),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          AppIcon(),
          SizedBox(height: 48.0),
          AppTextField(inputText: 'Ingresar Email',obscureText: false,onChanged: (value){ _email=value;},),
          SizedBox(height: 8.0),
          AppTextField(inputText: 'Ingresar Contraseña',obscureText: true,onChanged: (value){_password=value;},),
          SizedBox(height: 23.0),
          AppButton(
            color: Colors.blueAccent,
            onPressed: () async { 
              try {
                var newUser = await auth.createUserWithEmailAndPassword(email: _email, password: _password);
                if(newUser!= null){
                  Navigator.pushNamed(context, '/chat');
                }
              } catch (e) {
                print(e);
              }
            },
            name: "Registrarse",
          ),

        ],)
      )
    );
  }
}