import 'package:flutter/material.dart';

class EditInputForm extends StatelessWidget {
  const EditInputForm(
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
        cursorColor: Colors.indigo,
        decoration: InputDecoration(
            prefixIcon: icon,
            border: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.lightBlue,
              width: 2,
            )),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.blue,
              width: 2,
            )),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.lightBlue)),
        maxLength: maxLength,
      ),
    );
  }
}
