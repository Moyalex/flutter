import 'package:flutter/material.dart';
import 'package:trial/src/drawer/drawer.dart';

class Administer extends StatefulWidget {

  @override
  _AdministerState createState() => _AdministerState();
}

class _AdministerState extends State<Administer> {
  String _opcionSeleccionada ='Moises';
  List<String> _personas = ['Moises','Emilio','Oscar','Angel'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administracion'),
      ),
      drawer: getDrawer(context),
      body: Container(
        child: Column(
          children: 
          <Widget>[
            _crearDropdown(),
          ],
        ),
      ),
    );
  }

  Widget _crearDropdown(){
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        Expanded(
                  child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt){
              setState(() {
                _opcionSeleccionada=opt;
              });
            },
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(){
    List<DropdownMenuItem<String>> lista = new List();
    _personas.forEach((persona){
      lista.add(DropdownMenuItem(
        child: Text(persona),
        value: persona,
      ));
    });
    return lista;
  }

  // GridView myGrid = GridView.count(
  //     crossAxisCount: 2,
  //     // children: myWidgets
  // );

  // Widget _myGrid(){ 
  //   return CustomScrollView(
  //     primary: false,
  //     slivers: <Widget>[
  //       SliverPadding(
  //         padding: const EdgeInsets.all(20),
  //         sliver: SliverGrid.count(
  //           crossAxisSpacing: 10,
  //           mainAxisSpacing: 10,
  //           crossAxisCount: 2,
  //           children: <Widget>[
  //             Container(
  //               padding: const EdgeInsets.all(8),
  //               child: const Text('He\'d have you all unravel at the'),
  //               color: Colors.green[100],
  //             ),
  //             Container(
  //               padding: const EdgeInsets.all(8),
  //               child: const Text('Heed not the rabble'),
  //               color: Colors.green[200],
  //             ),
  //             Container(
  //               padding: const EdgeInsets.all(8),
  //               child: const Text('Sound of screams but the'),
  //               color: Colors.green[300],
  //             ),
  //             Container(
  //               padding: const EdgeInsets.all(8),
  //               child: const Text('Who scream'),
  //               color: Colors.green[400],
  //             ),
  //             Container(
  //               padding: const EdgeInsets.all(8),
  //               child: const Text('Revolution is coming...'),
  //               color: Colors.green[500],
  //             ),
  //             Container(
  //               padding: const EdgeInsets.all(8),
  //               child: const Text('Revolution, they...'),
  //               color: Colors.green[600],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
  
}