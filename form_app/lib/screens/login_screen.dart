import 'package:flutter/material.dart';
import 'package:form_app/mixins/validation_mixins.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with validationMixins {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
       child: Form(
         key:formKey,
         child: Column(
           children: <Widget>[
             emailField(),
             passwordField(),
             Container(margin: EdgeInsets.only(top: 25.0),),
             submitField(),
           ]
         )
         ),
    );
  }

  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText:'Email',
        hintText:'you@example.com'
      ),
      validator: validateEmail,
      onSaved: (String value){

      },
    );
  }

  Widget passwordField(){
    return Container(
      margin: EdgeInsets.only(bottom: 25.0),
    child:TextFormField(
      obscureText: true,
      decoration:InputDecoration(
        labelText: 'Contraseña',
        hintText:'Contraseña'
      ),
      validator: validatePassword,
      onSaved: (String value){
        
      },
    )
    );
  }

  Widget submitField(){
    return RaisedButton(
      onPressed: (){
        if (formKey.currentState.validate()) {
        formKey.currentState.save();   
        }
      },
    child: Text("Enviar "),
    );
  }

}

