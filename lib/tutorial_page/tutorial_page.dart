import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:ramen_map_app/home_page/components/signup_button.dart';
import 'package:ramen_map_app/login_page/login_page.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: "ステップ1",
            body: "map",
            image: const Center(
                // child: Image.asset(""),
                )),
        PageViewModel(
            title: "ステップ2",
            body: "set",
            image: const Center(
                // child: Image.asset(""),
                )),
        PageViewModel(
            title: "ステップ3",
            body: "list",
            image: const Center(
                // child: Image.asset(""),
                )),
        PageViewModel(
            title: "早速始めましょう！",
            bodyWidget: Align(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 80.0,
                  ),
                  const SignupButton(),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text("アカウント作成済の方はこちら"),
                  )
                ],
              ),
            ),
            image: const Center(
              child: CircleAvatar(
                maxRadius: 100,
                backgroundImage: NetworkImage(
                    "https://th.bing.com/th/id/OIP.ah0wDB6kaCKldChTg1evsQHaFj?w=250&h=187&c=7&r=0&o=5&dpr=1.5&pid=1.7"),
              ),
            )),
      ],
      showDoneButton: false,
      showSkipButton: true,
      skip: const Text("スキップ"),
      next: const Text("次へ"),
    );
  }
}
