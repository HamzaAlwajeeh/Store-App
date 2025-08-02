import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/categories_cubit/categories_cubit.dart';
import 'package:store_app/cubits/products_cubit/products_cubit.dart';
import 'package:store_app/screens/add_product_screen.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_product_screen.dart';
import 'package:store_app/simple_bloc_obsever.dart';

void main() async {
  Bloc.observer = SimpleBlocObsever();
  runApp(const StoreApp());
  // List<ProductModel> produts = [];
  // produts = await AllProductsService().getAllProducts();
  // log(produts.toString());
  // List<dynamic> categories = await AllCategoriesService().getAllCategories();
  // log(categories.toString());
  // List<ProductModel> produts = [];
  // produts = await CategoriesService().getProductsByCategory(
  //   categoryName: 'electronics',
  // );
  // log(produts.toString());
  // ProductModel product = await AddProductService().addProduct(
  //   title: 'New Product',
  //   price: '29.99',
  //   description: 'This is a new product',
  //   image: 'https://example.com/image.jpg',
  //   category: 'electronics',
  // );
  // log(product.toString());
  // ProductModel updatedProduct = await UpdateProductService().updateProduct(
  //   id: 20,
  //   title: "Hamza",
  //   price: '300',
  //   description: 'flutter',
  //   image: 'image.png',
  //   category: 'cateelectronicsgory',
  // );
  // log(updatedProduct.toString());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductsCubit()..getAllProducts()),
        BlocProvider(create: (context) => CategoriesCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        title: 'Store App',
        home: const HomePage(),
        routes: {
          UpdateProductScreen.route: (context) => UpdateProductScreen(),
          AddProductScreen.route: (context) => AddProductScreen(),
        },
      ),
    );
  }
}
