import 'package:flutter/material.dart';

class DropdownMenu extends StatelessWidget {
  const DropdownMenu(
      {Key? key,
      required this.items,
      required this.icon,
      required this.hintText,
      required this.onChanged})
      : super(key: key);
  final List<DropdownMenuItem<String>> items;
  final Icon icon;
  final String hintText;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170.0,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
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
              hintText: hintText,
              prefixIcon: icon),
          items: items,
          onChanged: onChanged),
    );
  }
}
