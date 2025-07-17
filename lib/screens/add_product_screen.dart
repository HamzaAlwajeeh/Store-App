import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
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
  String? title, desc, price, image, category;
  List<dynamic> categories = [];
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
    return Scaffold(
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
        child: Column(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            CustomButton(text: 'ADD', onPressed: () {}),
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
