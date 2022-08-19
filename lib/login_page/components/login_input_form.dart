import 'package:flutter/material.dart';

class LoginInputForm extends StatelessWidget {
  const LoginInputForm(
      {Key? key,
      required this.labelText,
      required this.keyboardType,
      required this.controller})
      : super(key: key);
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.orange),
        ),
        controller: controller,
      ),
    );
  }
}
