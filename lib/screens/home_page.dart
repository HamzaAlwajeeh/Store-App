import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/cubits/categories_cubit/categories_cubit.dart';
import 'package:store_app/cubits/products_cubit/products_cubit.dart';
import 'package:store_app/screens/add_product_screen.dart';
import 'package:store_app/widgets/custom_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductsCubit>(context).getAllProducts();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "New Trend",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.cartPlus, color: Colors.black),
          ),
        ],
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is GetAllProductsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetAllProductsSuccess) {
            return CustomGridView();
          } else if (state is GetAllProductsFailure) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }
          return Center(child: Text('No products available'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<CategoriesCubit>(context).loadCategories();
          List<dynamic> categories =
              BlocProvider.of<CategoriesCubit>(context).categories;
          Navigator.of(
            context,
          ).pushNamed(AddProductScreen.route, arguments: categories);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
