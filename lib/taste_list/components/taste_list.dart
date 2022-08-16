import 'package:flutter/material.dart';

class TasteList extends StatelessWidget {
  const TasteList({Key? key, required this.taste, required this.imageURL})
      : super(key: key);
  final String taste;
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 14.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Stack(children: <Widget>[
        Ink(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imageURL), fit: BoxFit.cover)),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color.fromARGB(173, 48, 46, 46),
              ),
              child: Text(
                taste,
                style: const TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            )),
      ]),
    );
  }
}
