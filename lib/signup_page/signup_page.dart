import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/auth_gate/auth_gate_page.dart';
import 'package:ramen_map_app/home_page/home_page.dart';
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
                  isObscure: false,
                ),
                SignupInputForm(
                  labelText: "パスワード(8文字以上)",
                  keyboardType: TextInputType.visiblePassword,
                  controller: newPasswordController,
                  isObscure: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0, bottom: 15.0),
                  child: SizedBox(
                    width: 300,
                    child: Text(
                      signupController.error,
                      style: const TextStyle(color: Colors.red, fontSize: 10.0),
                    ),
                  ),
                )
              ],
            ),
            MaterialButton(
              onPressed: () async {
                try {
                  {
                    await signupController.signUpUser(
                        newEmail: newEmailController.text,
                        newPassword: newPasswordController.text);
                    // ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthGatePage()),
                        (_) => false);
                  }
                } catch (e) {
                  if (newEmailController.text.isEmpty &&
                      newPasswordController.text.isEmpty) {
                    signupController.setErrorText("メールアドレス又はパスワード未入力です。");
                  } else if (newPasswordController.text.length < 8) {
                    signupController.setErrorText("パスワードは8文字以上です。");
                    // ignore: unrelated_type_equality_checks
                  } else if (e.hashCode == 455200916) {
                    signupController.setErrorText('既にこのメールアドレスは利用されてます。');
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        '登録エラー\n再度お試しください。',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 1),
                    ),
                  );
                  print(e.hashCode);
                }
              },
              child: const ButtonDesign(),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (_) => false,
                );
              },
              child: const Text("アカウント作成済の方はこちら"),
            )
          ],
        ),
      ),
    );
  }
}
