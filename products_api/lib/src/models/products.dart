import 'dart:convert';

class Products {
  String productId;
  String name;
  String category;
  String color;
  String unitPrice;
  String availableQuantity;

  Products({this.productId,this.name,this.category,this.color,this.unitPrice,this.availableQuantity});

  factory Products.fromJson(Map<String, dynamic> map){
    return Products(
      productId: map["ProductId"],
      name: map["Name"],
      category: map["Category"],
      color: map["Color"],
      unitPrice: map["UnitPrice"],
      availableQuantity: map["AvailableQuantity"],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "ProductId": productId,
      "Name": name,
      "Category": category,
      "Color": color,
      "UnitPrice": unitPrice,
      "AvailableQuantity": availableQuantity,
    };
  }

  @override
  String toString() {
    return 'Products{ProductId: $productId, Name:$name, Category:$category, Color:$color, UnitPrice: $unitPrice, AvailableQuantity: $availableQuantity}';
  }

}

List<Products> productsFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Products>.from(data.map((item) => Products.fromJson(item)));
}

String productsToJson(Products data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
