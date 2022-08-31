import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/home_page/components/signup_button.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: Text(
          "利用方法",
          style: TextStyle(color: Colors.white),
        ),
        color: LinearGradient(colors: [
          Colors.orangeAccent,
          Color.fromARGB(255, 255, 178, 34),
          Color.fromARGB(255, 255, 230, 64)
        ]),
        widgets: [],
      ),
      body: IntroductionScreen(
        pages: [
          PageViewModel(
              title: "ステップ1",
              body: "住所検索 or 登録したい地点を\n長押しして場所を決定。",
              image: ListView(children: <Widget>[
                Image.asset("assets/images/map.jpg"),
              ]),
              decoration: const PageDecoration(imageFlex: 3)),
          PageViewModel(
              title: "ステップ2",
              body: "お店登録画面で各項目を入力し登録。",
              image: ListView(children: <Widget>[
                Image.asset(
                  "assets/images/set.jpg",
                ),
              ]),
              decoration: const PageDecoration(imageFlex: 3)),
          PageViewModel(
              title: "ステップ3",
              body: "登録したお店を味別の一覧で表示\n地域で絞り込みも可能。",
              image: ListView(children: <Widget>[
                Image.asset("assets/images/list1.jpg"),
              ]),
              decoration: const PageDecoration(imageFlex: 3)),
          PageViewModel(
              title: "自分だけのラーメンリストを\n作ってみよう！",
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
                        Navigator.pop(context);
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
      ),
    );
  }
}
