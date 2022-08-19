import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/signup_page/signup_controller.dart';

class SignupButton extends ConsumerWidget {
  const SignupButton(
      {Key? key, required this.newEmail, required this.newPassword})
      : super(key: key);
  final String newEmail;
  final String newPassword;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupController = ref.watch(signupControllerProvider);

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
              width: 30.0,
              child: Icon(
                Icons.login_outlined,
                color: Colors.greenAccent,
              ),
            )
          ]),
        ),
      ),
      onPressed: () {
        if (newEmail.isNotEmpty && newPassword.isNotEmpty) {
          signupController.signUpUser(
              newEmail: newEmail, newPassword: newPassword);
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "登録エラー",
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
    );
  }
}
