import 'package:flutter/material.dart';

class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Divider(),
            _inputUsuario(),
            Divider(),
            _inputPassword(),
            Divider(),
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal:30.0),
              color: Colors.lightBlueAccent,
              child: Text('Ingresar'),
              onPressed: (){
                Navigator.pushNamed(context, 'activities');
              }
            ),
          ],
        ),
      ),
    );
  }

  _inputUsuario() {
    return TextField(
      // autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Usuario',
        labelText: 'Usuario',
        suffixIcon: Icon(Icons.account_box),
        // icon: Icon(Icons.account_circle),
      ),
    );
  }

  Widget _inputPassword(){
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Contraseña',
        labelText: 'Contraseña',
        suffixIcon: Icon(Icons.lock_outline),
        // icon: Icon(Icons.lock),
      ),
    );
  }

}