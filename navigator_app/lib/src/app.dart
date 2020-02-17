import 'package:flutter/material.dart';
import 'package:navigator_app/src/screens/second.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Primera Pantalla")
       ),
       body: Center(
         child:RaisedButton(
           child:  Text("Mostrar Pantalla"),
           onPressed: (){
             Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => Second(title: "Hola",)
                 )
             );   
           }
         ,)
       ),
    );
  }
}