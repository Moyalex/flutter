import 'package:flutter/material.dart';
import 'package:trial/src/drawer/drawer.dart';

class Results extends StatefulWidget {

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Resultados'),
      ),
      drawer: getDrawer(context),
    );
  }
}