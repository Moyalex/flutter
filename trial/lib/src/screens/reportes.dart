import 'package:flutter/material.dart';
import 'package:trial/src/drawer/drawer.dart';
import 'package:intl/intl.dart';

class Reportes extends StatefulWidget {
  Reportes({Key key}) : super(key: key);

  @override
  _ReportesState createState() => _ReportesState();
}

class _ReportesState extends State<Reportes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Reportes'),
      ),
      drawer: getDrawer(context),
      body: Column(
        children: <Widget>[
          _myDate(),
          _myDataReportes('Mesero Luis 10/10=100%'),
          _myDataReportes('Cajero PABLO 1/10 = 10%'),
          _myDataReportes('Cajero PABLO 5/10 = 50%'),
        ],
      ),
    );
  }

  Widget _myDate(){
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d/M/y').format(now);
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          child: Container(
            width: double.infinity,
            height: 20,
            child: Text('Fecha: $formattedDate',
            textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _myDataReportes(String data1){
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          child: Container(
            width: double.infinity,
            height: 20,
            child: Text(data1,
              style: TextStyle(
                fontSize: 20.0
              ),
            ),
          ),
        ),
      ),
    );
  }

}

  Widget _mygrid(){
    return DefaultTabController(
            length: 1,
            child: Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        GridRecomendaro(Colors.blue),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }

class GridRecomendaro extends StatefulWidget {
  final Color color;
  GridRecomendaro(this.color);
  @override
  _GridRecomendaroState createState() => _GridRecomendaroState();
}

class _GridRecomendaroState extends State<GridRecomendaro> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 1,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemBuilder: (context,i){
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            width: 30,
            height: 30,
            color: widget.color,
            child: Text(
              "Mesero Luis 10/10=100%",
              style: TextStyle(
                fontSize: 25.0
              ),
            ),
          ),
        );
      },
    );
  }
}