import 'package:flutter/material.dart';
import 'package:ramen_map_app/home_page/components/login_button.dart';
import 'package:ramen_map_app/home_page/components/signup_button%20copy.dart';
import 'package:ramen_map_app/taste_list/taste_list_page.dart';

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
              children: const [
                LoginButton(),
                SizedBox(
                  height: 10.0,
                ),
                SignupButton()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
