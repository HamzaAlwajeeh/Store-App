import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helper/custome_snake_bar.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/add_product_service.dart';
import 'package:store_app/services/all_categories_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_form_field.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});
  static String route = '/add-product';

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, desc, price, image, category;
  List<dynamic> categories = [];
  bool isLoading = false;
  @override
  void initState() {
    fechAllCategories();
    super.initState();
  }

  Future<List<dynamic>?> fechAllCategories() async {
    List<dynamic> newCategories =
        await AllCategoriesService().getAllCategories();
    setState(() {
      categories = newCategories;
    });
    return null;
  }

  String? categoryValue;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Add New Prosuct'),
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: addProductMethod(),
        ),
      ),
    );
  }

  Form addProductMethod() {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Column(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            CustomTextFormField(
              hint: 'Product Name',
              onChanged: (data) {
                title = data;
              },
            ),
            CustomTextFormField(
              hint: 'Description',
              onChanged: (data) {
                desc = data;
              },
            ),
            CustomTextFormField(
              inputType: TextInputType.number,
              hint: 'Price',
              onChanged: (data) {
                price = data;
              },
            ),
            CustomTextFormField(
              hint: 'Image',
              onChanged: (data) {
                image = data;
              },
            ),
            buildDropdownButton(),
            CustomButton(
              text: 'ADD',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await addProduct();

                  Navigator.pop(context);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addProduct() async {
    try {
      setState(() {
        isLoading = true;
      });
      ProductModel newProduct = await AddProductService().addProduct(
        title: title!,
        price: price.toString(),
        description: desc!,
        image: image!,
        category: categoryValue ?? '',
      );
      setState(() {
        isLoading = false;
      });
      log(newProduct.toString());
      customSnakBatr(context, message: 'Product added successfully');
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      customSnakBatr(context, message: e.toString());
    }
  }

  SizedBox buildDropdownButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade400),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            value: categoryValue,
            onChanged: (String? value) {
              setState(() {
                categoryValue = value;
              });
            },
            hint: Text('Select Category', style: TextStyle(fontSize: 18)),
            isExpanded: true,
            items:
                categories
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item as String,
                        child: Text(
                          item.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    )
                    .toList(),
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 140,
            ),
            menuItemStyleData: const MenuItemStyleData(height: 40),
            iconStyleData: IconStyleData(iconSize: 35),
          ),
        ),
      ),
    );
  }
}
