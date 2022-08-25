import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/edit_store/edit_store_page.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/map_page/map_controller.dart';
import 'package:ramen_map_app/map_page/map_page.dart';
import 'package:ramen_map_app/service/common_method.dart';
import 'package:ramen_map_app/store_list_page/components/delete_store_dialog.dart';

class StoreDataBottomSheet extends ConsumerWidget {
  const StoreDataBottomSheet({Key? key, required this.store}) : super(key: key);
  final Store store;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 400.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 70.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                gradient: const LinearGradient(colors: [
                  Colors.red,
                  Colors.deepOrange,
                  Colors.orangeAccent
                ]),
                border: Border.all(color: Colors.white, width: 3.0)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    store.name,
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                            color: Colors.blueAccent,
                            icon: const Icon(Icons.edit_outlined),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditStorePage(store: store)));
                            }),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                            color: Colors.redAccent,
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (childContext) {
                                    return DeleteCheckDialog(store: store);
                                  });
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          LimitedBox(
            maxHeight: 220.0,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "価格",
                      ),
                      Text(
                        "${store.price}円",
                        style: const TextStyle(fontSize: 20.0),
                      )
                    ],
                  ),
                  leading: const Icon(
                    Icons.money_outlined,
                    color: Colors.deepOrange,
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "エリア",
                      ),
                      Text(
                        store.area,
                        style: const TextStyle(fontSize: 20.0),
                      )
                    ],
                  ),
                  leading: const Icon(
                    Icons.map_outlined,
                    color: Colors.deepOrange,
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "味",
                      ),
                      Text(
                        store.taste,
                        style: const TextStyle(fontSize: 20.0),
                      )
                    ],
                  ),
                  leading: const Icon(
                    Icons.dining_outlined,
                    color: Colors.deepOrange,
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "メモ",
                      ),
                      SizedBox(
                        height: 60.0,
                        width: 200.0,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            store.memo,
                            style: const TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  leading: const Icon(
                    Icons.note_outlined,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 45.0,
            width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: const LinearGradient(
                  colors: [Colors.red, Colors.deepOrange, Colors.orangeAccent]),
            ),
            child: MaterialButton(
              onPressed: () {
                ref.watch(mapControllerProvider).addMarker(store: store);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapPage(
                      storeId: store.storeId,
                      latitude: store.latitude,
                      longitude: store.longitude,
                    ),
                  ),
                );
              },
              child: const Text(
                "場所確認",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Text(
            "追加日： ${getDateString(store.timeStamp)}",
          ),
        ],
      ),
    );
  }
}
