import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/map_page/map_controller.dart';
import 'package:ramen_map_app/map_page/map_page.dart';
import 'package:ramen_map_app/service/common_method.dart';
import 'package:ramen_map_app/store_list_page/components/delete_store_dialog.dart';
import 'package:ramen_map_app/store_list_page/components/edit_store_page.dart';

class StoreData extends ConsumerWidget {
  const StoreData({Key? key, required this.store}) : super(key: key);
  final Store store;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapControllerProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "追加日： ${getDateString(store.timeStamp)}",
                  style: const TextStyle(fontSize: 15.0),
                ),
                Text(
                  " 場所：${store.area}",
                  style: const TextStyle(fontSize: 15.0),
                ),
              ],
            ),
            Container(
              height: 290.0,
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 14.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: InkWell(
                  onTap: () {
                    mapController.addMarker(store);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MapPage(
                                  storeId: store.storeId,
                                )));
                  },
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Ink.image(
                            height: 250.0,
                            image: NetworkImage(store.ramenImage),
                            fit: BoxFit.fitHeight,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 190.0, left: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  store.name,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "味分類： ${store.taste}",
                                      style: const TextStyle(
                                          color: Colors.orange, fontSize: 15.0),
                                    ),
                                    Text(
                                      " 価格：${store.price}円",
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                          backgroundColor: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "一言メモ:${store.memo}",
                        maxLines: 2,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100.0,
                  child: MaterialButton(
                      color: Colors.blueAccent,
                      child: Row(
                        children: const [
                          Icon(Icons.edit_note_outlined),
                          Text(
                            "編集",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditStorePage(store: store)));
                      }),
                ),
                SizedBox(
                  width: 100.0,
                  child: MaterialButton(
                      color: Colors.redAccent,
                      child: Row(
                        children: const [
                          Icon(Icons.delete_outline),
                          Text(
                            "削除",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
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
    );
  }
}
