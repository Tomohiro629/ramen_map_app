import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/signup_page/components/signup_button.dart';
import 'package:ramen_map_app/signup_page/components/signup_input_form.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  labelText: "パスワード",
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) {
                    newPassword = value!;
                  },
                )
              ],
            ),
            SignupButton(
              newEmail: newEmail,
              newPassword: newPassword,
            )
          ],
        ),
      ),
    );
  }
}
