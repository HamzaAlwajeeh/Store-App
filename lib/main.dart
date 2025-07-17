import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/services/all_products_service.dart';

void main() async {
  runApp(const StoreApp());
  List<ProductModel> produts = [];
  produts = await AllProductsService().getAllProducts();
  log(produts.toString());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      title: 'Store App',
      home: const HomePage(),
    );
  }
}
