import 'package:flutter/material.dart';

class SetButtonDesign extends StatelessWidget {
  const SetButtonDesign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      child: Container(
        width: 160.0,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              offset: Offset(0.0, 20.0),
              blurRadius: 30.0,
              color: Colors.black12)
        ], color: Colors.white, borderRadius: BorderRadius.circular(22.0)),
        child: Row(children: <Widget>[
          Container(
            height: 50.0,
            width: 120.0,
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 195, 14, 1),
                  Color.fromARGB(255, 248, 55, 41),
                  Color.fromARGB(255, 217, 81, 81)
                ]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(95.0),
                    topLeft: Radius.circular(95.0),
                    bottomRight: Radius.circular(200.0))),
            child: const Text(
              '登録',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 30.0,
            child: Icon(
              Icons.add_outlined,
              color: Colors.redAccent,
            ),
          )
        ]),
      ),
    );
  }
}
