part of 'categories_cubit.dart';

class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesLoadedSuccess extends CategoriesState {}

final class CategoriesLoadedFailure extends CategoriesState {
  final String errorMessage;

  CategoriesLoadedFailure({required this.errorMessage});
}
