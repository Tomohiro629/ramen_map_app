import 'package:flutter/material.dart';

class PriceField extends StatelessWidget {
  PriceField({Key? key}) : super(key: key);
  final price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.0,
      child: TextFormField(
        controller: price,
        keyboardType: TextInputType.number,
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
              Icons.money_outlined,
              color: Colors.orangeAccent,
            ),
            labelText: '値段'),
      ),
    );
  }
}
