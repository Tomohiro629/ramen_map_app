import 'package:flutter/material.dart';
import 'package:ramen_map_app/store_list_page/components/store_area_list_page.dart';

class AreaDialog extends StatelessWidget {
  const AreaDialog({Key? key, required this.taste}) : super(key: key);
  final String taste;

  @override
  Widget build(
    BuildContext context,
  ) {
    String area = "";
    return AlertDialog(
      backgroundColor: const Color.fromARGB(104, 0, 0, 0),
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Container(
                color: Colors.white,
                child: DropdownButtonFormField(
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
                      hintText: "エリアで絞る",
                    ),
                    items: const [
                      DropdownMenuItem(value: "北区", child: Text("北区")),
                      DropdownMenuItem(value: "左京区", child: Text("左京区")),
                      DropdownMenuItem(value: "右京区", child: Text("右京区")),
                      DropdownMenuItem(value: "上京区", child: Text("上京区")),
                      DropdownMenuItem(value: "中京区", child: Text("中京区")),
                      DropdownMenuItem(value: "下京区", child: Text("下京区")),
                      DropdownMenuItem(value: "南区", child: Text("南区")),
                      DropdownMenuItem(value: "西京区", child: Text("西京区")),
                      DropdownMenuItem(value: "東山区", child: Text("東山区")),
                      DropdownMenuItem(value: "山科区", child: Text("山科区")),
                      DropdownMenuItem(value: "伏見区", child: Text("伏見区")),
                      DropdownMenuItem(value: "京都市外", child: Text("京都市外")),
                    ],
                    onChanged: (String? value) {
                      area = value!;
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
                if (area.isNotEmpty) {
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return StoreAreaListPage(
                          area: area,
                          taste: taste,
                        );
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
                        "エリアを選択してください。",
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
