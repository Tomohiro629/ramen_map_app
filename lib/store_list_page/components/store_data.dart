import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/map_page/map_page.dart';
import 'package:ramen_map_app/service/common_method.dart';

class StoreData extends ConsumerWidget {
  const StoreData({Key? key, required this.store}) : super(key: key);
  final Store store;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 16.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MapPage(store: store)));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    store.name,
                    style: const TextStyle(fontSize: 25.0),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Ink.image(
                      height: 250.0,
                      image: NetworkImage(store.ramenImage),
                      fit: BoxFit.fitWidth,
                    )
                  ],
                ),
                Container(
                  child: Text(
                    "メモ： ${store.memo}",
                    style: const TextStyle(fontSize: 15.0),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      getDateString(store.timeStamp),
                      style: const TextStyle(fontSize: 15.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          " ${store.price}円",
                          style: const TextStyle(fontSize: 25.0),
                        ),
                      ),
                    ),
                  ],
                ),
                ButtonBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
