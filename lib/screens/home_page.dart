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
      body: Center(child: ProductCard()),
    );
  }
}
