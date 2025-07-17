import 'package:store_app/constants/constants.dart';
import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> categories = await Api().get(url: '$KBaseUrl/categories');

    return categories;
  }
}

// class AllCategoriesService2 {
//   final dio = Dio();

//   Future<List<dynamic>> getAllCategories() async {
//     try {
//       Response response = await dio.get(
//         'https://fakestoreapi.com/products/categories',
//       );
//       List<dynamic> jsonData = response.data;

//       List<ProductModel> productsList = [];

//       for (var item in jsonData) {
//         ProductModel product = ProductModel.fromJson(item);
//         productsList.add(product);
//       }
//       return productsList;
//     } on DioException catch (e) {
//       String errorMessage = e.message.toString();
//       throw Exception('Failed to load categories: $errorMessage');
//     } catch (e) {
//       throw Exception('Failed to load categories: $e');
//     }
//   }
// }
