import 'package:flutter/material.dart';

class EditDropdownMenu extends StatelessWidget {
  const EditDropdownMenu(
      {Key? key,
      required this.items,
      required this.icon,
      required this.hintText,
      required this.onChanged,
      required this.value})
      : super(key: key);
  final List<DropdownMenuItem<String>> items;
  final Icon icon;
  final String hintText;
  final void Function(String?)? onChanged;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170.0,
      child: DropdownButtonFormField(
          value: value,
          decoration: InputDecoration(
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
              hintText: hintText,
              prefixIcon: icon),
          items: items,
          onChanged: onChanged),
    );
  }
}
