import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/products_cubit/products_cubit.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/product_card.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});
  @override
  Widget build(BuildContext context) {
    List<ProductModel> products =
        BlocProvider.of<ProductsCubit>(context).products;
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 50, left: 5, right: 5),
      clipBehavior: Clip.none,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 2,
        childAspectRatio: 1,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Center(child: ProductCard(productModel: products[index]));
      },
    );
  }
}
