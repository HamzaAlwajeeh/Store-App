import 'package:store_app/constants/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data = await Api().get(url: KBaseUrl, token: '');

    List<ProductModel> productsList = [];
    for (var product in data) {
      productsList.add(ProductModel.fromJson(product));
    }
    return productsList;
  }
}
