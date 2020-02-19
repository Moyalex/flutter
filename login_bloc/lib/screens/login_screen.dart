import 'dart:js';

import 'package:flutter/material.dart';
import 'package:login_bloc/bloc/bloc.dart';
// import 'package:login_bloc/bloc/provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  // final bloc = Bloc();

  @override 
  Widget build(BuildContext context) {
    final bloc = Provider.of<Bloc>(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 25.0),),
          submitButton(bloc),
        ]
      ),
    );
  }

  Widget emailField(Bloc bloc){
    return StreamBuilder(
      stream:bloc.email,
      builder: (context,snapshot){

        return TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText:'you@example.com',
                labelText:'Email',
                errorText:snapshot.error,
              ),
              onChanged: bloc.changeEmail
            );

      },
    );
  }

  Widget passwordField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context,snatshot){
            return TextField(
          decoration: InputDecoration(
            labelText:'Contraseña',
            hintText:'Contraseña',
            errorText: snatshot.error,
          ),
          onChanged: bloc.changePassword
        );
      }
      );
    
  }

  Widget submitButton(Bloc bloc){
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context,snapshot){
        return RaisedButton(
          child: Text('Enviar'),
          onPressed: snapshot.hasData ? bloc.submit : null,
        );  
      },
    );
  }

}