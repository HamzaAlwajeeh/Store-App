import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/services/all_categories_service.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  List<dynamic> categories = [];
  void loadCategories() async {
    emit(CategoriesLoading());
    try {
      categories = await AllCategoriesService().getAllCategories();
      emit(CategoriesLoadedSuccess());
    } catch (e) {
      emit(CategoriesLoadedFailure(errorMessage: e.toString()));
    }
  }
}
