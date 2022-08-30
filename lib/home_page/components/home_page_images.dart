import 'package:flutter/material.dart';

class HomePageImages extends StatelessWidget {
  const HomePageImages({Key? key, required this.imageURL}) : super(key: key);
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 200.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(
            image: AssetImage(imageURL),
            fit: BoxFit.cover,
          )),
    );
  }
}
