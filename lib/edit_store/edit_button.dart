import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({
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
            height: 45.0,
            width: 120.0,
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 47, 33, 243),
                  Color.fromARGB(207, 35, 69, 239),
                  Colors.lightBlue
                ]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(95.0),
                    topLeft: Radius.circular(95.0),
                    bottomRight: Radius.circular(200.0))),
            child: const Center(
              child: Text(
                '変更',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            width: 30.0,
            child: Icon(
              Icons.edit_note_outlined,
              color: Colors.blueAccent,
            ),
          )
        ]),
      ),
    );
  }
}
