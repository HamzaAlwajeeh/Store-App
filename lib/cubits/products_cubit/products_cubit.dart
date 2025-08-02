import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/add_product_service.dart';
import 'package:store_app/services/all_products_service.dart';
import 'package:store_app/services/update_product_service.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  //Get All Products
  List<ProductModel> products = [];
  void getAllProducts() async {
    emit(GetAllProductsLoading());
    try {
      products = await AllProductsService().getAllProducts();
      emit(GetAllProductsSuccess());
    } catch (e) {
      emit(GetAllProductsFailure(errorMessage: e.toString()));
    }
  }

  //Add Product
  void addProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    emit(AddProductLoading());
    try {
      var newProduct = await AddProductService().addProduct(
        title: title,
        price: price,
        description: description,
        image: image,
        category: category,
      );
      log('Product added: $newProduct');
      emit(AddProductSuccess());
    } catch (e) {
      emit(AddProductFailure(errorMessage: e.toString()));
    }
  }

  //Update Product
  void updateProduct({
    required int id,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    emit(UpdateProductLoading());
    try {
      var updatedProduct = await UpdateProductService().updateProduct(
        id: id,
        title: title,
        price: price,
        description: description,
        image: image,
        category: category,
      );
      log('Product updated: $updatedProduct');
      emit(UpdateProductSuccess());
    } catch (e) {
      emit(UpdateProductFailure(errorMessage: e.toString()));
    }
  }
}
