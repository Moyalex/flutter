import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          Container(margin: EdgeInsets.only(top: 25.0),),
          submitButton()
        ]
      ),
    );
  }

  Widget emailField(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText:'you@example.com',
        labelText:'Email',
        errorText:''
      )
    );
  }

  Widget passwordField(){
    return TextField(
      decoration: InputDecoration(
        labelText:'Contraseña',
        hintText:'Contraseña'
      )
    );
  }

  Widget submitButton(){
    return RaisedButton(
      child: Text('Enviar'),
      onPressed: (){},
    );
  }

}