import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final List<Widget> widgets;
  final Gradient color;
  const BaseAppBar(
      {Key? key,
      required this.title,
      required this.widgets,
      required this.color})
      : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return NewGradientAppBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.0))),
      title: title,
      elevation: 5,
      centerTitle: true,
      actions: widgets,
      gradient: color,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
