import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/map_page/map_controller.dart';
import 'package:ramen_map_app/map_page/map_page.dart';
import 'package:ramen_map_app/repository/store_repository.dart';
import 'package:ramen_map_app/service/common_method.dart';
import 'package:ramen_map_app/store_list_page/components/delete_store_dialog.dart';
import 'package:ramen_map_app/store_list_page/components/edit_store_page.dart';

class StoreData extends ConsumerWidget {
  const StoreData({Key? key, required this.store}) : super(key: key);
  final Store store;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapControllerProvider);
    final storeRepository = ref.watch(storeRepositoryProvider);

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
                  style: TextStyle(fontSize: 15.0.sp),
                ),
                Text(
                  " 場所：${store.area}",
                  style: TextStyle(fontSize: 15.0.sp),
                ),
              ],
            ),
            Stack(
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 14.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Stack(
                    children: [
                      Container(
                        height: 230.0.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            image: DecorationImage(
                              image: NetworkImage(store.ramenImage),
                              fit: BoxFit.cover,
                            )),
                        child: InkWell(
                          splashColor: const Color.fromARGB(119, 255, 184, 77),
                          onTap: () {
                            mapController.addMarker(store);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MapPage(
                                          storeId: store.storeId,
                                        )));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 230.0.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Align(
                              alignment: Alignment.bottomLeft,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        store.name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0.sp),
                                      ),
                                      Text(
                                        "味分類： ${store.taste}",
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontSize: 15.0.sp),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.black87),
                                    child: Text(
                                      " 価格：${store.price}円",
                                      style: TextStyle(
                                        fontSize: 18.0.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.amber[100],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      store.favorite == null
                          ? storeRepository.addFavoriteStore(store.storeId)
                          : storeRepository.deleteFavoriteStore(store.storeId);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(store.favorite == null
                              ? SnackBar(
                                  content: Text(
                                    "${store.name}を\nお気に入りに登録しました！",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor:
                                      const Color.fromARGB(219, 209, 67, 186),
                                  duration: const Duration(seconds: 1),
                                )
                              : SnackBar(
                                  content: Text(
                                    "${store.name}を\nお気に入りから削除しました。",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor:
                                      const Color.fromARGB(219, 67, 209, 140),
                                  duration: const Duration(seconds: 1),
                                ));
                    },
                    icon: store.favorite == null
                        ? const Icon(
                            Icons.favorite_outline,
                            size: 20.0,
                          )
                        : const Icon(
                            Icons.favorite_outline_outlined,
                            color: Color.fromARGB(179, 246, 14, 173),
                            size: 20.0,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "一言メモ:${store.memo}",
                      maxLines: 2,
                      style: TextStyle(fontSize: 15.0.sp),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          color: Colors.blueAccent,
                          icon: const Icon(Icons.edit_outlined),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EditStorePage(store: store)));
                          }),
                      IconButton(
                          color: Colors.redAccent,
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (childContext) {
                                  return DeleteCheckDialog(store: store);
                                });
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
