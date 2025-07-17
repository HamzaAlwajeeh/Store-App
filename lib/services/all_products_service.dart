import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    http.Response response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );

    List<dynamic> jsonData = jsonDecode(response.body);

    List<ProductModel> productsList = [];
    for (var product in jsonData) {
      productsList.add(ProductModel.fromJson(product));
    }
    return productsList;
  }
}
