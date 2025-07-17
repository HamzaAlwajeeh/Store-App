import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductScreen extends StatelessWidget {
  const UpdateProductScreen({super.key});
  static String route = '/update-screen';

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Update Prosuct')),
    );
  }
}
