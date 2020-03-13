import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate { 

  String seleccion ='';
  final peliculasProvider= new PeliculasProvider();

  final peliculas = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam!',
    'Ironman',
    'Capitan America'
  ];
  final peliculasRecientes=[
    'Spiderman',
    'Capitan America'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query='';
      }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation), onPressed: (){
      close(context, null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return Container();
    }
    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData) {
          final peliculas = snapshot.data;
          return ListView(
            children: peliculas.map((pelicula){
              return
            }).toList();
          );
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   final listaSugerida=(query.isEmpty)
  //                       ?peliculasRecientes
  //                       :peliculas.where((p)=>p.toLowerCase().startsWith(query.toLowerCase())).toList();
  //   // TODO: implement buildSuggestions
  //   return ListView.builder(
  //     itemCount: peliculasRecientes.length,
  //     itemBuilder: (BuildContext context, int i) {
  //     return ListTile(
  //       leading: Icon(Icons.movie),
  //       title: Text(peliculasRecientes[i]),
  //       onTap: (){
  //         seleccion=listaSugerida[i];
  //         showResults(context);
  //       },
  //     );
  //    },
  //   );
  // }
  
}