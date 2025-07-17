import 'package:store_app/constants/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getProductsByCategory({
    required String categoryName,
  }) async {
    List<dynamic> data = await Api().get(
      url: '$KBaseUrl/category/$categoryName',
      token: '',
    );

    List<ProductModel> productsList = [];
    for (var product in data) {
      productsList.add(ProductModel.fromJson(product));
    }
    return productsList;
  }
}
