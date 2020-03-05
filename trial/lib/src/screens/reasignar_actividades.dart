import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:trial/src/drawer/drawer.dart';

class ReAsignarActividades extends StatefulWidget {
  ReAsignarActividades({Key key}) : super(key: key);

  @override
  _ReAsignarActividadesState createState() => _ReAsignarActividadesState();
}

class _ReAsignarActividadesState extends State<ReAsignarActividades> {
  String _opcionSeleccionada ='Moises';
  List<String> _personas = ['Moises','Emilio','Oscar','Angel'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Re-asigna actividades'),
      ),
      drawer: getDrawer(context),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _crearDropdown(),
                            _crearSlideListView('Barrer'),
                            _crearSlideListView('Limpiar'),
                            _crearSlideListView('Cerrar'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: FlatButton(
                            color: Colors.blue,
                            onPressed: (){},
                            child: Text(
                              '>',
                              style: TextStyle(
                                fontSize: 25.0,
                              ),
                          )),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: FlatButton(
                            color: Colors.blue,
                            onPressed: (){},
                            child: Text(
                              '>',
                              style: TextStyle(
                                fontSize: 25.0,
                              ),
                          )),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _crearDropdown(),
                            _crearSlideListView('Abrir cortinas'),
                            _crearSlideListView('Limpiar mesas'),
                            _crearSlideListView('Ordenar'),
                            _crearSlideListView('Cerrar cortinas'),
                            _crearSlideListView('Hacer corte'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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

  _crearSlideListView(String tarea){
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.15,
      child: Container(
        color: Colors.white,
        child: ListTile(
          title: Text(tarea),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Terminada',
          color: Colors.green,
          icon: Icons.check,
          onTap: () => {},
        ),
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