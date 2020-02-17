import 'package:flutter/material.dart';

class MyTextFlied extends StatefulWidget {
  MyTextFlied({Key key}) : super(key: key);

  @override
  _MyTextFliedState createState() => _MyTextFliedState();
}

class _MyTextFliedState extends State<MyTextFlied> {
  String inputText ="";
  final TextEditingController controller=TextEditingController();

  void onSubmitted(String value){
    setState(() {
      inputText=inputText+"\n"+value;
      controller.text="";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Textfield Widget")
       ),
       body: Container(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText:"Ingrese el texto aquí"),
              onSubmitted: onSubmitted,
              controller: controller,
            ),
            Text(inputText)
         ],)
       ),
    );
  }
}