import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:trial/src/drawer/drawer.dart';

class ValidarActividades extends StatefulWidget {
  ValidarActividades({Key key}) : super(key: key);

  @override
  _ValidarActividadesState createState() => _ValidarActividadesState();
}

class _ValidarActividadesState extends State<ValidarActividades> {
  String _opcionSeleccionada ='Moises';
  List<String> _personas = ['Moises','Emilio','Oscar','Angel'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Validar actividades'),
      ),
      drawer: getDrawer(context),
      body: SingleChildScrollView(
              child: Container(
          child: Column(
            children: <Widget>[
              _crearDropdown(),
              _crearSlideListView(),
              _crearSlideListView(),
              _crearSlideListView(),
              _crearSlideListView(),
              _crearSlideListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearDropdown(){
    return Row(
      children: <Widget>[
        Icon(Icons.arrow_forward_ios),
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

  _crearSlideListView(){
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.15,
      child: Container(
        color: Colors.white,
        child: ListTile(
          // leading: Text(
          //   '12:00',
          //   style: TextStyle(
          //     fontSize: 20.0,
          //     fontWeight: FontWeight.bold
          //   ),
          // ),
          // leading: CircleAvatar(
          //   backgroundColor: Colors.indigoAccent,
          //   child: Text('T'),
          //   foregroundColor: Colors.white,
          // ),
          title: Text('Tarea n°1'),
          subtitle: Text('Hacer slide listview'),
        ),
      ),
      // actions: <Widget>[
      //   IconSlideAction(
      //     caption: 'Archive',
      //     color: Colors.blue,
      //     icon: Icons.archive,
      //     onTap: () => {},
      //   ),
      //   IconSlideAction(
      //     caption: 'Share',
      //     color: Colors.indigo,
      //     icon: Icons.share,
      //     onTap: () => {},
      //   ),
      // ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Terminada',
          color: Colors.green,
          icon: Icons.check,
          onTap: () => {},
        ),
        // IconSlideAction(
        //   caption: 'Pausar',
        //   color: Colors.yellow,
        //   icon: Icons.pause,
        //   onTap: () => {},
        // ),
        IconSlideAction(
          caption: 'Cancelada',
          color: Colors.red,
          icon: Icons.close,
          onTap: () => {},
        ),
      ],
    );
  }

}