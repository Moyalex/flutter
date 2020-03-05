import 'package:flutter/material.dart';

Drawer getDrawer(BuildContext context){

    var header = DrawerHeader(child: Text("Menu"));
    var info = AboutListTile(
      child: Text("Informacion App"),
      applicationIcon: Icon(Icons.favorite),
      applicationVersion: 'V1.0.0',
      icon: Icon(Icons.info),
    );
  ListTile getItem(Icon icon,String description,String route){
    return ListTile(
      leading: icon,
      title: Text(description),
      onTap: (){
        Navigator.pushNamed(context, route);
      },
    );
  }

  ListView getList(){
    return ListView(
      children: <Widget>[
        header,
        getItem(Icon(Icons.access_time),'Mis actividades','activities'),
        getItem(Icon(Icons.assignment_turned_in),'Reportes','reports'),
        getItem(Icon(Icons.border_color),'Re-asignar actividades','reasign'),
        getItem(Icon(Icons.border_color),'Validar actividades','valid'),
        info,
        ListTile(
          leading: Icon(Icons.close),
          title: Text('Cerrar Session'),
          onTap:()=>_mostrarAlert(context),
        ),
      ],
    );
    }
  return Drawer(child: getList()); 
  
}

void _mostrarAlert(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Cerrar Session'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('¿Desea cerrar session?'),
              // FlutterLogo(size: 100.0,),
            ],
          ),
          actions: <Widget>[
            FlatButton(onPressed: ()=>Navigator.of(context).pop(), child: Text('Cancelar')),
            FlatButton(onPressed: (){
              Navigator.pushNamed(context, '/');
            }, child: Text('Ok')),
          ],
        );
      },
      );
  }