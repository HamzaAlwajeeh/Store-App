import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Trend"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.cartPlus, color: Colors.black),
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: 150,
          width: 200,
          decoration: BoxDecoration(),
          child: Card(
            child: Column(
              children: [
                Text("Store App", style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
