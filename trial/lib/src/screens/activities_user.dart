import 'package:flutter/material.dart';
import 'package:trial/src/drawer/drawer.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ActivitiesUser extends StatefulWidget {
  ActivitiesUser({Key key}) : super(key: key);

  @override
  _ActivitiesUserState createState() => _ActivitiesUserState();
}

class _ActivitiesUserState extends State<ActivitiesUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Mis actividades'),
      ),
      drawer: getDrawer(context),
      body: SingleChildScrollView(
              child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: <Widget>[
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

  _crearSlideListView(){
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.10,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: Text(
            '12:00',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
          ),
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
          caption: 'Empezar',
          color: Colors.green,
          icon: Icons.play_arrow,
          onTap: () => {},
        ),
        IconSlideAction(
          caption: 'Pausar',
          color: Colors.yellow,
          icon: Icons.pause,
          onTap: () => {},
        ),
        IconSlideAction(
          caption: 'Detener',
          color: Colors.red,
          icon: Icons.stop,
          onTap: () => {},
        ),
      ],
    );
  }

}