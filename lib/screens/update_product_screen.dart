import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helper/custome_snake_bar.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_form_field.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});
  static String route = '/update-screen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, desc, price, image;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Update Prosuct'),
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 15,
                children: [
                  Image.network(productModel.image, height: 300),
                  CustomTextFormField(
                    hint: 'Product Name',
                    value: productModel.title,
                    onChanged: (data) {
                      title = data;
                    },
                  ),
                  CustomTextFormField(
                    hint: 'Description',
                    value: productModel.description,
                    onChanged: (data) {
                      desc = data;
                    },
                  ),
                  CustomTextFormField(
                    inputType: TextInputType.number,
                    hint: 'Price',
                    value: productModel.price.toString(),
                    onChanged: (data) {
                      price = data;
                    },
                  ),
                  CustomTextFormField(
                    hint: 'Image',
                    value: productModel.image,
                    onChanged: (data) {
                      image = data;
                    },
                  ),

                  CustomButton(
                    text: 'UPDATE',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        ProductModel updatedproductModel = await updateProduct(
                          productModel,
                        );
                        isLoading = false;
                        setState(() {});
                        Navigator.of(context).pop();
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<ProductModel> updateProduct(ProductModel productModel) async {
    late ProductModel updatedProduct;
    try {
      updatedProduct = await UpdateProductService().updateProduct(
        id: productModel.id,
        title: title ?? productModel.title,
        price: price ?? productModel.price.toString(),
        description: desc ?? productModel.description,
        image: image ?? productModel.image,
        category: productModel.category,
      );
      log(updatedProduct.toString());
      customSnakBatr(context, message: "Product updated successfully");
    } on Exception catch (e) {
      customSnakBatr(context, message: e.toString());
      isLoading = false;
      setState(() {});
    }
    return updatedProduct;
  }
}
