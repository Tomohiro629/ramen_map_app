import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/store_list_page/store_list_page.dart';
import 'package:ramen_map_app/taste_list/components/logout_dialog.dart';
import 'package:ramen_map_app/taste_list/components/taste_list.dart';

class TasteListPage extends ConsumerWidget {
  const TasteListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tastesList = tastes;

    return Scaffold(
      appBar: BaseAppBar(
        title: const Text(
          "味一覧",
          style: TextStyle(color: Colors.white),
        ),
        color: const LinearGradient(
            colors: [Colors.red, Colors.deepOrange, Colors.orangeAccent]),
        widgets: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const LogoutDialog();
                      });
                },
                icon: const Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            GridView.count(
              crossAxisCount: 2,
              children: tastesList,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    gradient: const LinearGradient(colors: [
                      Colors.red,
                      Colors.deepOrange,
                      Colors.orangeAccent
                    ]),
                  ),
                  width: 200.0,
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const StoreListPage(
                                      taste: "",
                                    ))));
                      },
                      child: const Text(
                        "全てのお店",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
