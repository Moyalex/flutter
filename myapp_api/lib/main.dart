import 'package:flutter/material.dart';
import 'package:myapp_api/models/products_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final materialApp = MaterialApp(
      title:'',
      home: ProductsScreen(),
    );
    return materialApp;
  }
}
