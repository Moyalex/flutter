import 'package:flutter/material.dart';
import 'package:navigatorbar_app/src/screens/first.dart';
import 'package:navigatorbar_app/src/screens/second.dart';
import 'package:navigatorbar_app/src/screens/third.dart';

class MyNavigator extends StatefulWidget {
  MyNavigator({Key key}) : super(key: key);

  @override
  _MyNavigatorState createState() => _MyNavigatorState();
}

class _MyNavigatorState extends State<MyNavigator> {
  @override
  Widget build(BuildContext context) {
    return 
    DefaultTabController(length: 3,child: Scaffold(
       appBar: AppBar(
         title: Text("Demo Bottom Navigator Bar"),
         backgroundColor: Colors.redAccent,
         bottom: TabBar(tabs: <Widget>[
           Tab(icon:Icon(Icons.home)),
           Tab(icon:Icon(Icons.ondemand_video)),
           Tab(icon:Icon(Icons.contacts)),
         ]),
       ),
       body: TabBarView(children: <Widget>[
         FirstTab(),
         SecondTab(),
         ThirdTab()
       ]),
       bottomNavigationBar: Material(
         color:Colors.blueAccent,
         child:TabBar(tabs: <Tab>[
            Tab(icon:Icon(Icons.alarm)),
            Tab(icon:Icon(Icons.watch_later)),
            Tab(icon:Icon(Icons.airplanemode_active)),
         ],)
       ),
    )
    );
  }
}