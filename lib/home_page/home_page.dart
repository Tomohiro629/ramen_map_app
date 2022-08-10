import 'package:flutter/material.dart';

import 'package:ramen_map_app/login_page/login_page.dart';
import 'package:ramen_map_app/map_page/map_page.dart';
import 'package:ramen_map_app/signup_page/signup_page.dart';

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
            const CircleAvatar(
              maxRadius: 100,
              backgroundImage: NetworkImage(
                  "https://th.bing.com/th/id/OIP.ah0wDB6kaCKldChTg1evsQHaFj?w=250&h=187&c=7&r=0&o=5&dpr=1.5&pid=1.7"),
            ),
            Text(
              ("My Ramen Map").toUpperCase(),
              style: const TextStyle(fontSize: 30.0, color: Colors.orange),
            ),
            Column(
              children: [
                MaterialButton(
                  child: InkWell(
                    child: Container(
                      width: 200.0,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0.0, 20.0),
                                blurRadius: 50.0,
                                color: Colors.black12)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.0)),
                      child: Row(children: <Widget>[
                        Container(
                          height: 50.0,
                          width: 150.0,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 20.0),
                          decoration: const BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(95.0),
                                  topLeft: Radius.circular(95.0),
                                  bottomRight: Radius.circular(200.0))),
                          child: Text(
                            'アカウント作成',
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                        const SizedBox(
                          width: 40.0,
                          child: Icon(Icons.edit_outlined, color: Colors.green),
                        )
                      ]),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupPage()));
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                MaterialButton(
                  child: InkWell(
                    child: Container(
                      width: 200.0,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0.0, 20.0),
                                blurRadius: 30.0,
                                color: Colors.black12)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.0)),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            width: 150.0,
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 40.0),
                            decoration: const BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(95.0),
                                    topLeft: Radius.circular(95.0),
                                    bottomRight: Radius.circular(200.0))),
                            child: Text(
                              'ログイン',
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                          const SizedBox(
                            width: 40.0,
                            child: Icon(
                              Icons.login_outlined,
                              color: Colors.orange,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MapPage()));
                },
                child: const Text("Map"))
          ],
        ),
      ),
    );
  }
}
