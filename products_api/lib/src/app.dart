import 'package:flutter/material.dart';
import 'package:products_api/src/screens/form_add.dart';
import 'package:products_api/src/screens/homescreen.dart';

GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor:Colors.blueAccent,
      ),
      home: Scaffold(
        key: _scaffoldState,
        appBar: AppBar(
          title:Text(
            "Productos Crud API",
            style: TextStyle(
              color:Colors.white,
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap:(){
                Navigator.push(_scaffoldState.currentContext
                , MaterialPageRoute(builder: (BuildContext context){
                  return FormAddScreen();
                })
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                ),
            )
          ],
        ),
        body: HomeScreen(),
      ),
    );
  }
}
