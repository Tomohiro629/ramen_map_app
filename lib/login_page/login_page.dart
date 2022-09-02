import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/login_page/components/button_design.dart';
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
                    isObscure: false,
                  ),
                  LoginInputForm(
                    labelText: "パスワード",
                    keyboardType: TextInputType.visiblePassword,
                    controller: password,
                    isObscure: true,
                  ),
                ],
              ),
              MaterialButton(
                  onPressed: () async {
                    try {
                      {
                        await loginController.loginUser(
                            email: email.text, password: password.text);
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      }
                    } catch (e) {
                      if (e.toString() ==
                          "[firebase_auth/unknown] Given String is empty or null") {
                        loginController.setErrorText("メールアドレス又はパスワード未入力です。");
                      } else if (e.toString() ==
                          "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
                        loginController.setErrorText("登録のないメールアドレスです。");
                      } else {
                        loginController.setErrorText("ログインエラー\n再度お試しください。");
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            loginController.errorMessage,
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.red,
                          duration: const Duration(seconds: 2),
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
