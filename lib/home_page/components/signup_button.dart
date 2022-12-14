import 'package:flutter/material.dart';
import 'package:ramen_map_app/signup_page/signup_page.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: InkWell(
        child: Container(
          width: 200.0,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
                offset: Offset(0.0, 20.0),
                blurRadius: 50.0,
                color: Colors.black12)
          ], color: Colors.white, borderRadius: BorderRadius.circular(22.0)),
          child: Row(children: <Widget>[
            Container(
              height: 50.0,
              width: 150.0,
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 16, 145, 20),
                    Color.fromARGB(255, 4, 179, 94),
                    Colors.greenAccent
                  ]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(95.0),
                      topLeft: Radius.circular(95.0),
                      bottomRight: Radius.circular(200.0))),
              child: const Text(
                'アカウント作成',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 40.0,
              child: Icon(Icons.person_add_alt_1_outlined, color: Colors.green),
            )
          ]),
        ),
      ),
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const SignupPage()),
            (_) => false);
      },
    );
  }
}
