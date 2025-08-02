import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/cubits/products_cubit/products_cubit.dart';
import 'package:store_app/helper/custome_snake_bar.dart';
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
  List<dynamic>? categories;

  bool isLoading = false;
  String? categoryValue;
  @override
  Widget build(BuildContext context) {
    categories = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is AddProductLoading) {
          isLoading = true;
        } else if (state is AddProductSuccess) {
          customSnakBatr(context, message: 'Product added successfully');
          BlocProvider.of<ProductsCubit>(context).getAllProducts();
          isLoading = false;
          Navigator.pop(context);
        } else if (state is AddProductFailure) {
          customSnakBatr(context, message: state.errorMessage);
          isLoading = false;
        }
      },
      builder:
          (context, state) => ModalProgressHUD(
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
                  BlocProvider.of<ProductsCubit>(context).addProduct(
                    title: title!,
                    price: price.toString(),
                    description: desc!,
                    image: image!,
                    category: categoryValue ?? '',
                  );
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
                categories!
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
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
