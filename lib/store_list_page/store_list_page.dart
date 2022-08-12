import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/store_list_page/store_list_controller.dart';

class StoreListPage extends ConsumerWidget {
  const StoreListPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeListController = ref.watch(storeListProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "店一覧",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
          child: FirestoreListView<Store>(
        query: storeListController.storeQuery(),
        itemBuilder: (context, snapshot) {
          final store = snapshot.data();
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: const Offset(2, 4),
                        blurRadius: 5,
                        spreadRadius: 2)
                  ],
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(159, 93, 248, 240),
                        Color.fromARGB(248, 9, 19, 217)
                      ])),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 16,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const MapPage()));
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Ink.image(
                                  //   height: 200,
                                  //   image: const NetworkImage(
                                  //       "https://th.bing.com/th/id/R.bea13a512a6ccecdc6b53884a42ccc43?rik=DWbiVOy5XHCHoA&riu=http%3a%2f%2fwww.satonoeki-ohara.com%2fwp-content%2fuploads%2f2015%2f02%2fIMG_3422-e1435630515125.jpg&ehk=%2bCEeyT5V3cVHWVXIZrnj7AA1SdKp82DSyRXGWiMHDUc%3d&risl=&pid=ImgRaw&r=0"),
                                  //   fit: BoxFit.fitWidth,
                                  // )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  store.name,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  '${store.price}円',
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  store.memo,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ));
        },
      )),
    );
  }
}
