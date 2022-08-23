import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/store_list_page/store_list_controller.dart';

class DeleteCheckDialog extends ConsumerWidget {
  const DeleteCheckDialog({
    Key? key,
    required this.store,
  }) : super(key: key);
  final Store store;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeListController = ref.watch(storeListProvider);

    return AlertDialog(
      backgroundColor: const Color.fromARGB(165, 0, 0, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        "『${store.name}』\nを削除しますか？",
        style: const TextStyle(color: Colors.white),
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
                storeListController.deleteStore(store.storeId);
                Navigator.of(context).pop();
                Navigator.of(context, rootNavigator: true).pop();
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
