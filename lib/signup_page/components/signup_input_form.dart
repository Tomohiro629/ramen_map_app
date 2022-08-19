import 'package:flutter/material.dart';

class SignupInputForm extends StatelessWidget {
  const SignupInputForm(
      {Key? key,
      required this.labelText,
      required this.keyboardType,
      required this.onChanged})
      : super(key: key);
  final String labelText;
  final TextInputType keyboardType;
  final void Function(String?)? onChanged;

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
        onChanged: onChanged,
      ),
    );
  }
}
