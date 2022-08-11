import 'package:flutter/material.dart';

class StoreField extends StatelessWidget {
  StoreField({Key? key}) : super(key: key);
  final storeName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.0,
      child: TextFormField(
        controller: storeName,
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
              Icons.ramen_dining_outlined,
              color: Colors.orangeAccent,
            ),
            labelText: '店舗名'),
      ),
    );
  }
}
