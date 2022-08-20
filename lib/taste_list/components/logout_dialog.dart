import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/service/auth_service.dart';

class LogoutDialog extends ConsumerWidget {
  const LogoutDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authSevice = ref.watch(authServiceProvider);

    return AlertDialog(
      backgroundColor: const Color.fromARGB(165, 0, 0, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text(
        "ログアウトしますか",
        style: TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MaterialButton(
              child: Container(
                  height: 30.0,
                  width: 60.0,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 195, 14, 1),
                    Color.fromARGB(255, 248, 55, 41),
                    Color.fromARGB(255, 217, 81, 81)
                  ])),
                  child: const Center(
                    child: Text(
                      "はい",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              onPressed: () async {
                authSevice.logOut();
                Navigator.of(context).pop();
              },
            ),
            MaterialButton(
              child: Container(
                  height: 30.0,
                  width: 60.0,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.blue,
                    Colors.lightBlue,
                    Colors.blueAccent
                  ])),
                  child: const Center(
                    child: Text(
                      "いいえ",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ],
    );
  }
}
