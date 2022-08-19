import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/login_page/login_page_controller.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({Key? key, required this.email, required this.password})
      : super(key: key);
  final String email;
  final String password;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.watch(loginControllerProvider);
    return MaterialButton(
        onPressed: () {
          if (email.isNotEmpty && password.isNotEmpty) {
            loginController.loginUser(email: email, password: password);
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "ログインエラー",
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 1),
              ),
            );
          }
        },
        child: InkWell(
          child: Container(
            width: 200.0,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  offset: Offset(0.0, 20.0),
                  blurRadius: 30.0,
                  color: Colors.black12)
            ], color: Colors.white, borderRadius: BorderRadius.circular(22.0)),
            child: Row(children: <Widget>[
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
                child: Text(
                  'ログイン',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              const SizedBox(
                width: 40.0,
                child: Icon(
                  Icons.login_outlined,
                  color: Colors.orange,
                ),
              )
            ]),
          ),
        ));
  }
}
