import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/service/auth_service.dart';
import 'package:ramen_map_app/taste_list/components/taste_list.dart';

class TasteListPage extends ConsumerWidget {
  const TasteListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authSevice = ref.watch(authServiceProvider);
    String taste = "";
    var List = [
      const TasteList(
        taste: "醤油",
        imageURL: "images/syoyu.jpg",
      ),
      const TasteList(
        taste: "豚骨",
        imageURL: "images/tonkotu.jpg",
      ),
      const TasteList(
        taste: "豚骨醤油",
        imageURL: "images/tonkotusyoyu.jpg",
      ),
      const TasteList(
        taste: "味噌",
        imageURL: "images/miso.jpg",
      ),
      const TasteList(
        taste: "塩",
        imageURL: "images/sio.jpg",
      ),
      const TasteList(
        taste: "その他",
        imageURL: "images/sonota.jpg",
      )
    ];

    return Scaffold(
        appBar: BaseAppBar(
          title: const Text(
            "味一覧",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.orangeAccent,
          widgets: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                  onPressed: () {
                    authSevice.logOut();
                  },
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                  )),
            )
          ],
        ),
        body: Center(
            child: GridView.count(
          crossAxisCount: 2,
          children: List,
        )));
  }
}
