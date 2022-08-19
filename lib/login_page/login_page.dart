import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/login_page/components/login_button.dart';
import 'package:ramen_map_app/login_page/components/login_input_form.dart';
import 'package:ramen_map_app/login_page/login_page_controller.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.watch(loginControllerProvider);
    final email = TextEditingController();
    final password = TextEditingController();

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
                    controller: email,
                  ),
                  LoginInputForm(
                    labelText: "パスワード",
                    keyboardType: TextInputType.visiblePassword,
                    controller: password,
                  )
                ],
              ),
              MaterialButton(
                  onPressed: () {
                    if (email.text.isNotEmpty && password.text.isNotEmpty) {
                      loginController.loginUser(
                          email: email.text, password: password.text);
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
                  child: const ButtonDesign())
            ]),
      ),
    );
  }
}
