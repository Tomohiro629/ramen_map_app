import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TakeImageButton extends ConsumerWidget {
  const TakeImageButton({Key? key, required this.onTap, required this.icon})
      : super(key: key);
  final void Function() onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: MaterialButton(
          shape: const CircleBorder(side: BorderSide(color: Colors.orange)),
          onPressed: onTap,
          child: icon),
    );
  }
}
