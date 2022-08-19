import 'package:flutter/material.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/login_page/components/login_button.dart';
import 'package:ramen_map_app/login_page/components/login_input_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    String email = "";
    String password = "";

    return Scaffold(
      appBar: const BaseAppBar(
        title: Text(
          "ログイン",
          style: TextStyle(color: Colors.white),
        ),
        widgets: [],
        color: LinearGradient(
            colors: [Colors.red, Colors.deepOrange, Colors.orangeAccent]),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  LoginInputForm(
                    labelText: "メールアドレス",
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value!;
                    },
                  ),
                  LoginInputForm(
                    labelText: "パスワード",
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {
                      password = value!;
                    },
                  )
                ],
              ),
              LoginButton(
                email: email,
                password: password,
              )
            ]),
      ),
    );
  }
}
