part of 'products_cubit.dart';

class ProductsState {}

final class ProductsInitial extends ProductsState {}

//Get All Products States
class GetAllProductsInitial extends ProductsState {}

class GetAllProductsLoading extends ProductsState {}

class GetAllProductsSuccess extends ProductsState {}

class GetAllProductsFailure extends ProductsState {
  final String errorMessage;

  GetAllProductsFailure({required this.errorMessage});
}

//Add Product States
class AddProductInitial extends ProductsState {}

class AddProductLoading extends ProductsState {}

class AddProductSuccess extends ProductsState {}

class AddProductFailure extends ProductsState {
  final String errorMessage;

  AddProductFailure({required this.errorMessage});
}

//Update Product States
class UpdateProductInitial extends ProductsState {}

class UpdateProductLoading extends ProductsState {}

class UpdateProductSuccess extends ProductsState {}

class UpdateProductFailure extends ProductsState {
  final String errorMessage;

  UpdateProductFailure({required this.errorMessage});
}
