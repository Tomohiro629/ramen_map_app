import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/auth_gate/auth_gate_page.dart';
import 'package:ramen_map_app/signup_page/components/button_design.dart';
import 'package:ramen_map_app/signup_page/components/signup_input_form.dart';
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
        color: LinearGradient(colors: [
          Color.fromARGB(255, 16, 145, 20),
          Color.fromARGB(255, 4, 179, 94),
          Colors.greenAccent
        ]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SignupInputForm(
                  labelText: "メールアドレス",
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    newEmail = value!;
                  },
                ),
                SignupInputForm(
                  labelText: "パスワード(8文字以上)",
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) {
                    if (value!.length < 8) {
                      newPassword = value;
                    }
                  },
                )
              ],
            ),
            MaterialButton(
              onPressed: () {
                if (newEmail.isNotEmpty || newPassword.isNotEmpty) {
                  signupController.signUpUser(
                      newEmail: newEmail, newPassword: newPassword);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthGatePage()),
                      (_) => false);
                } else if (newPassword.length < 8) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "パスワードは8文字以上です。",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 1),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "登録エラー",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              child: const ButtonDesign(),
            ),
          ],
        ),
      ),
    );
  }
}
