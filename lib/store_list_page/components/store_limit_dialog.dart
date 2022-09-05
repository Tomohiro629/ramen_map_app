import 'package:flutter/material.dart';
import 'package:ramen_map_app/store_list_page/components/store_limit_page.dart';

class StoreLimitDialog extends StatelessWidget {
  const StoreLimitDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    int? number;
    return AlertDialog(
      backgroundColor: const Color.fromARGB(104, 0, 0, 0),
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Container(
                color: Colors.white,
                child: DropdownButtonFormField<int>(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.orange,
                        width: 2,
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.deepOrange,
                        width: 2,
                      )),
                      hintText: "件数で絞る",
                    ),
                    items: const [
                      DropdownMenuItem(value: 1, child: Text("1件")),
                      DropdownMenuItem(value: 2, child: Text("2件")),
                      DropdownMenuItem(value: 3, child: Text("3件")),
                      DropdownMenuItem(value: 4, child: Text("4件")),
                      DropdownMenuItem(value: 5, child: Text("5件")),
                      DropdownMenuItem(value: 6, child: Text("6件")),
                      DropdownMenuItem(value: 7, child: Text("7件")),
                      DropdownMenuItem(value: 8, child: Text("8件")),
                      DropdownMenuItem(value: 9, child: Text("9件")),
                      DropdownMenuItem(value: 10, child: Text("10件")),
                    ],
                    onChanged: (int? value) {
                      number = value!;
                    }),
              )),
      actions: [
        Align(
            alignment: Alignment.center,
            child: MaterialButton(
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.deepOrange),
              ),
              color: Colors.white,
              onPressed: () {
                if (number != null) {
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return StoreLimitPage(number: number!);
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const double begin = 0.0;
                        const double end = 1.0;
                        final Animatable<double> tween =
                            Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: Curves.easeInOut));
                        final Animation<double> doubleAnimation =
                            animation.drive(tween);
                        return FadeTransition(
                          opacity: doubleAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "件数を選択してください。",
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: const Text("検索"),
            ))
      ],
    );
  }
}
