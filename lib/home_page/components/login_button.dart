import 'package:flutter/material.dart';
import 'package:ramen_map_app/login_page/login_page.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: InkWell(
        child: Container(
          width: 200.0,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
                offset: Offset(0.0, 20.0),
                blurRadius: 30.0,
                color: Colors.black12)
          ], color: Colors.white, borderRadius: BorderRadius.circular(22.0)),
          child: Row(
            children: <Widget>[
              Container(
                height: 50.0,
                width: 140.0,
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 40.0),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.red,
                      Colors.deepOrange,
                      Colors.orangeAccent
                    ]),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(95.0),
                        topLeft: Radius.circular(95.0),
                        bottomRight: Radius.circular(200.0))),
                child: const Text(
                  'ログイン',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 40.0,
                child: Icon(
                  Icons.login_outlined,
                  color: Colors.orange,
                ),
              )
            ],
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      },
    );
  }
}
