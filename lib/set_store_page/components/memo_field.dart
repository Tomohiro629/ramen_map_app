import 'package:flutter/material.dart';

class MemoField extends StatelessWidget {
  MemoField({Key? key}) : super(key: key);
  final memo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.0,
      child: TextFormField(
        controller: memo,
        decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.deepOrange,
              width: 2,
            )),
            prefixIcon: Icon(
              Icons.note_outlined,
              color: Colors.orangeAccent,
            ),
            labelText: 'メモ'),
      ),
    );
  }
}
