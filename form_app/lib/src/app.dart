import 'package:flutter/material.dart';
import 'package:form_app/screens/login_screen.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iniciar Sesion',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}