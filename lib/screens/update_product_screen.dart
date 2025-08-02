import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/cubits/products_cubit/products_cubit.dart';
import 'package:store_app/helper/custome_snake_bar.dart';
import 'package:store_app/models/product_model.dart';
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
    return BlocListener<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is UpdateProductLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is UpdateProductSuccess) {
          customSnakBatr(context, message: 'Product updated successfully');
          BlocProvider.of<ProductsCubit>(context).getAllProducts();
          isLoading = false;
          setState(() {});
          Navigator.pop(context);
        } else if (state is UpdateProductFailure) {
          customSnakBatr(context, message: state.errorMessage);
          isLoading = false;
          setState(() {});
        }
      },
      child: ModalProgressHUD(
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
                    Text(
                      productModel.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      productModel.description,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
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
                          BlocProvider.of<ProductsCubit>(context).updateProduct(
                            id: productModel.id,
                            title: title ?? productModel.title,
                            price: price ?? productModel.price.toString(),
                            description: desc ?? productModel.description,
                            image: image ?? productModel.image,
                            category: productModel.category,
                          );
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
