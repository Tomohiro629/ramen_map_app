import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/entity/store.dart';

class StoreData extends ConsumerWidget {
  const StoreData({Key? key, required this.store}) : super(key: key);
  final Store store;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
    );
  }
}
