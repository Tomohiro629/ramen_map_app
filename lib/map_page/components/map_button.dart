import 'package:flutter/material.dart';

class MapButton extends StatelessWidget {
  const MapButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final Icon icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      height: 50.0,
      color: const Color.fromARGB(154, 8, 0, 0),
      shape: const CircleBorder(),
      child: icon,
    );
  }
}
