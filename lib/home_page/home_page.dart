import 'package:flutter/material.dart';
import 'package:ramen_map_app/home_page/components/home_page_images.dart';
import 'package:ramen_map_app/home_page/components/login_button.dart';
import 'package:ramen_map_app/tutorial_page/tutorial_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 410.0,
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      children: const [
                        HomePageImages(
                            imageURL: "assets/images/home-image.jpg"),
                        HomePageImages(
                            imageURL: "assets/images/home-image3.jpg")
                      ],
                    ),
                    Row(
                      children: const [
                        HomePageImages(
                            imageURL: "assets/images/home-image2.jpg"),
                        HomePageImages(
                            imageURL: "assets/images/home-image1.jpg")
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "道\n中",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Yuji_Syuku",
                              fontSize: 20.0),
                        ),
                        Text("ら\nぁ\n麺",
                            style: TextStyle(
                                color: Colors.orange,
                                fontFamily: "Yuji_Syuku",
                                fontSize: 25.0)),
                        Text("京\n都",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Yuji_Syuku",
                                fontSize: 20.0)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const LoginButton(),
              const SizedBox(
                height: 10.0,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TutorialPage()),
                  );
                },
                child: const Text("初めて利用の方はこちら"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
