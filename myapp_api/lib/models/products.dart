import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp_api/models/global.dart';

class Products {
 String productId;
 String name;
 String category;
 String color;
 String unitPrice;
 String availableQuantity;
 Products({
   this.productId,
   this.name,
   this.category,
   this.color,
   this.unitPrice,
   this.availableQuantity
 });
 factory Products.fromJson(Map<String, dynamic> json){
   return Products(
     productId: json["ProductId"],
     name: json["Name"],
     category: json["Category"],
     color: json["Color"],
     unitPrice: json["UnitPrice"],
     availableQuantity: json["AvailableQuantity"],
   );
 }
}

//Fecth data from Restful API
Future<List<Products>> fetchProduts(http.Client client) async{
  final response = await client.get(URL_PRODUCTS);
  if (response.statusCode==200) {
    Map<String,dynamic> mapResponse = json.decode(response.body);
    if (mapResponse["xStatus"]=="success") {
      final products = mapResponse["data"].cast<Map<String,dynamic>>();
      final listProducts = await products.map<Products>((json){
        return Products.fromJson(json);
      }).toList();
      return listProducts;
    } else{
      return []; 
    }
  }else {
    throw Exception('Failed to load Products from the Internet');
  }
}