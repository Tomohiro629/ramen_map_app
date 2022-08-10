import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/home_page/signup_page/signup_controller.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupController = ref.watch(signupControllerProvider);

    String newEmail = "";
    String newPassword = "";

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "メールアドレス"),
              onChanged: (value) {
                newEmail = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "パスワード"),
              onChanged: (value) {
                newPassword = value;
              },
            ),
            MaterialButton(
              child: InkWell(
                child: Container(
                  width: 200.0,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0.0, 20.0),
                            blurRadius: 30.0,
                            color: Colors.black12)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.0)),
                  child: Row(children: <Widget>[
                    Container(
                      height: 50.0,
                      width: 150.0,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 40.0),
                      decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(95.0),
                              topLeft: Radius.circular(95.0),
                              bottomRight: Radius.circular(200.0))),
                      child: Text(
                        'サインアップ',
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
              ),
              onPressed: () {
                if (newEmail.isNotEmpty && newEmail.isNotEmpty) {
                  signupController.signUpUser(
                      newEmail: newEmail, newPassword: newPassword);
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("サインアップエラー"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
