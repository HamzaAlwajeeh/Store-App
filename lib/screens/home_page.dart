import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // surfaceTintColor: Colors.transparent,
        // scrolledUnderElevation: 0,
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
      body: CustomGridView(),
    );
  }
}

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 50, left: 5, right: 5),
      clipBehavior: Clip.none,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 2,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return Center(child: ProductCard());
      },
    );
  }
}
