import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
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
  String? title, desc, price, image, category;
  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 15,
                children: [
                  Image.network(productModel.image, height: 300),

                  CustomTextFormField(
                    hint: 'Title',
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
                  CustomTextFormField(
                    hint: 'Catgory',
                    value: productModel.category,
                    onChanged: (data) {
                      category = data;
                    },
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          log('''
title => $title
desc => $desc
price => $price
image => $image
category => $category
''');
                          Navigator.of(context).pop();
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                      child: Text(
                        'UPDATE ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
