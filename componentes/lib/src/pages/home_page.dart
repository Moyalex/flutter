import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _list(),
    );
  }

   Widget _list() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){

         return ListView(
          children: _listaItems(snapshot.data , context),
        );
      },
    );


   }

  List<Widget> _listaItems(List<dynamic> data,BuildContext context) {

    final List<Widget> opciones = [];

    data.forEach((opt){
      final widgettemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: getIcon('keyboard_arrow_right'),
        onTap: (){

          Navigator.pushNamed(context, opt['ruta']);

        },
      );

      opciones..add(widgettemp)
              ..add(Divider());

    });

    return opciones; 

  }
}