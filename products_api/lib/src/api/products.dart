
import 'package:products_api/src/models/products.dart';
import 'package:http/http.dart' show Client;

class ApiProducts{

  final String baseUrl="http://127.0.0.1:5000";
  Client client=Client();

  Future<List<Products>> getProducts() async {
    final response = await client.get("$baseUrl/api/products");
    if (response.statusCode == 200) {
      return productsFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createProducts(Products data) async {
    final response = await client.post(
      "$baseUrl/api/Products/CreateProduct/",
      headers: {"content-type": "application/json"},
      body: productsToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProducts(Products data) async {
    final response = await client.post(
      "$baseUrl/api/Products/UpdateProducto/",
      headers: {"content-type": "application/json"},
      body: productsToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProducts(String id) async {
    final response = await client.delete(
      "$baseUrl/api/Products/$id",
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

}