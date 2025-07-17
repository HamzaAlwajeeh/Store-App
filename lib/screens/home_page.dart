import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/services/all_products_service.dart';
import 'package:store_app/widgets/custom_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: AllProductsService().getAllProducts(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return CustomGridView(products: snapShot.data!);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
