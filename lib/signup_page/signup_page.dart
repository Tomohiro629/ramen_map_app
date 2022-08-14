import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/signup_page/signup_controller.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupController = ref.watch(signupControllerProvider);

    String newEmail = "";
    String newPassword = "";

    return Scaffold(
      appBar: const BaseAppBar(
        title: Text(
          "アカウント作成",
          style: TextStyle(color: Colors.white),
        ),
        widgets: [],
        color: Colors.greenAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 50.0),
                  child: TextFormField(
                    cursorColor: Colors.greenAccent,
                    decoration: const InputDecoration(
                      labelText: "メールアドレス",
                      labelStyle: TextStyle(color: Colors.greenAccent),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      newEmail = value;
                    },
                  ),
                ),
              ],
            ),
            Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 50.0),
                child: TextFormField(
                  cursorColor: Colors.greenAccent,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    labelText: "パスワード",
                    labelStyle: TextStyle(color: Colors.greenAccent),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    newPassword = value;
                  },
                )),
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
                          vertical: 15.0, horizontal: 20.0),
                      decoration: const BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(95.0),
                              topLeft: Radius.circular(95.0),
                              bottomRight: Radius.circular(200.0))),
                      child: Text(
                        'アカウント作成',
                        style: Theme.of(context).textTheme.button,
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
                if (newEmail.isNotEmpty && newEmail.isNotEmpty) {
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
            ),
          ],
        ),
      ),
    );
  }
}
