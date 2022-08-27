import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignupInputForm extends StatelessWidget {
  SignupInputForm(
      {Key? key,
      required this.labelText,
      required this.keyboardType,
      required this.controller,
      required this.validator,
      required this.isObscure})
      : super(key: key);
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool isObscure;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
      child: TextFormField(
        cursorColor: Colors.greenAccent,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.greenAccent),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.greenAccent,
            ),
          ),
        ),
        controller: controller,
        validator: validator,
        obscureText: isObscure,
      ),
    );
  }
}
