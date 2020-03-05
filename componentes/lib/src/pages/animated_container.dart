import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width=50.0;
  double _height=50.0;
  Color _color= Colors.pink;

  BorderRadiusGeometry _borderRadious   = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadious,
            color: _color,
          ),
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cambiaForma,
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  Void _cambiaForma(){
     final random = Random();
     setState(() {
       
      _width=random.nextInt(300).toDouble();
      _height=random.nextInt(300).toDouble();
      _color=Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1);
      _borderRadious = BorderRadius.circular(random.nextInt(100).toDouble());
     });
  }
}