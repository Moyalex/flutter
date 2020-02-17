import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  
  Drawer getDrawer(BuildContext context){

    var header = DrawerHeader(child: Text("Ajustes"));
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
        getItem(Icon(Icons.settings),'Configuración','/configuracion'),
        getItem(Icon(Icons.home),'Pagina Principal','/'),
        getItem(Icon(Icons.battery_charging_full),'Bateria','/bateria'),
        info,
      ],
    );
  }
  return Drawer(child: getList()); 
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Pagina Principal"), 
      ),
      drawer: getDrawer(context) 
    );
  }

}