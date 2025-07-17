import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onChanged,
    required this.hint,
    required this.value,
    this.inputType = TextInputType.text,
  });
  final void Function(String)? onChanged;
  final String hint, value;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      initialValue: value,
      validator: (data) {
        if (data!.isEmpty) {
          return 'This Field is required';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: hint,

        enabledBorder: buildingBorder(),
        border: buildingBorder(),
      ),
    );
  }

  OutlineInputBorder buildingBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: Colors.grey),
    );
  }
}
