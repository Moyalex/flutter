import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  final estiloTexto = new TextStyle(fontSize: 25.0);
  final conteo = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Numero de taps:',
            style: estiloTexto
            ),
            Text('$conteo',
            style: estiloTexto
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("Hola Mundo");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}