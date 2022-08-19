import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/login_page/components/login_button.dart';

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
                  Container(
                    width: 400.0.w,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 50.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: "メールアドレス",
                          labelStyle: TextStyle(color: Colors.orange)),
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                  ),
                ],
              ),
              Container(
                width: 400.0.w,
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 50.0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                      labelText: "パスワード",
                      labelStyle: TextStyle(color: Colors.orange)),
                  onChanged: (value) {
                    password = value;
                  },
                ),
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
