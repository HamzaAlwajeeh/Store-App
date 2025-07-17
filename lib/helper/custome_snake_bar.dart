import 'package:flutter/material.dart';

void customSnakBatr(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      // duration: Duration(seconds: 5),
      behavior: SnackBarBehavior.floating,
      elevation: 2,
      width: MediaQuery.of(context).size.width - 30,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.blue.shade300,
      padding: EdgeInsets.all(20),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    ),
  );
}
