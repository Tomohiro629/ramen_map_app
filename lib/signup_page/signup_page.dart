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
    final newEmailController = TextEditingController();
    final newPasswordController = TextEditingController();

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
                  controller: newEmailController,
                  validator: (newEmailController) {
                    if (newEmailController == null) {
                      return 'メールアドレスが未入力です。';
                    }
                    return null;
                  },
                ),
                SignupInputForm(
                  labelText: "パスワード(8文字以上)",
                  keyboardType: TextInputType.visiblePassword,
                  controller: newPasswordController,
                  validator: (newPasswordController) {
                    if (newPasswordController!.length < 8) {
                      return 'パスワードは8文字以上です。';
                    } else {
                      return null;
                    }
                  },
                )
              ],
            ),
            MaterialButton(
              onPressed: () {
                String errorText = '';
                if (newEmailController.text.isNotEmpty ||
                    newPasswordController.text.isNotEmpty) {
                  signupController.signUpUser(
                      newEmail: newEmailController.text,
                      newPassword: newPasswordController.text);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthGatePage()),
                      (_) => false);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        errorText,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 1),
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
