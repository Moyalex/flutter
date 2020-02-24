import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:myapp_api/models/products.dart';

class ProductsList extends StatelessWidget{
  final List<Products> products;
  ProductsList({Key key,this.products}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      itemBuilder: (context,index){
        return GestureDetector(
          child: Container(
            padding: EdgeInsets.all(10.0),
            color:  index%2==0 ? Colors.greenAccent:Colors.cyan,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget>[
                new Text(products[index].name,
                  style: TextStyle(fontWeight:FontWeight.bold,fontSize:16.0),
                ),
                new Text('Precio ${products[index].unitPrice}',
                  style: TextStyle(fontSize:16.0),
                )
              ],
            ),
          ),
          onTap: (){

          },
        );
      },
      itemCount: products.length,
    );
  }
}

class ProductsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductsScreenState();
  }
}

class _ProductsScreenState extends State<ProductsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Fetch Products from Restful API"),
      ),
      body: FutureBuilder(
        future: fetchProduts(http.Client()),
        builder: (){
          if (snapshot.hasError) {
            print(snapshot.error)
          }
          return snapshot.hasData ? ProductsList(products:snapshot.data):Center(child: CircularProgressIndicator(),)
        },
      )
    );
  }
}

