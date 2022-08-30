import 'package:flutter/material.dart';
import 'package:ramen_map_app/home_page/components/login_button.dart';
import 'package:ramen_map_app/tutorial_page/tutorial_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Stack(
              children: [
                Card(
                  // color: const Color.fromARGB(163, 255, 86, 34),
                  clipBehavior: Clip.antiAlias,
                  elevation: 14.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              height: 200.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/home-image.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            child: SizedBox(
                              height: 200.0,
                              width: 200.0,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "道\n中",
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          fontFamily: "Yuji_Syuku"),
                                    ),
                                    Text(
                                      "ら\nぁ\n麺",
                                      style: TextStyle(
                                          fontSize: 35.0,
                                          fontFamily: "Yuji_Syuku",
                                          color: Colors.deepOrange),
                                    ),
                                    Text(
                                      "京\n都",
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          fontFamily: "Yuji_Syuku"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 200.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/home-image2.jpg"),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 200.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/home-image1.jpg"),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
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
      ),
    );
  }
}
