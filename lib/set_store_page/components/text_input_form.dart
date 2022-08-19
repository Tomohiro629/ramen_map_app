import 'package:flutter/material.dart';

class TextInputForm extends StatelessWidget {
  const TextInputForm(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.keyboardType,
      required this.icon,
      required this.maxLength})
      : super(key: key);
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Icon icon;
  final String labelText;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.0,
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: icon,
            border: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.deepOrange,
              width: 2,
            )),
            labelText: labelText),
        maxLength: maxLength,
      ),
    );
  }
}
