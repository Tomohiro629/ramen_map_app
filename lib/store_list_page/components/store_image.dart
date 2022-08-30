import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/repository/store_repository.dart';
import 'package:ramen_map_app/store_list_page/components/store_data_bottom_sheet.dart';

class StoreImage extends ConsumerWidget {
  const StoreImage({Key? key, required this.store}) : super(key: key);
  final Store store;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeRepository = ref.watch(storeRepositoryProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            SizedBox(
              height: 250.0.h,
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 14.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Stack(
                  children: [
                    const Center(
                        child: CircularProgressIndicator(
                      color: Colors.deepOrange,
                    )),
                    Container(
                      height: 250.0.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                            image: NetworkImage(store.ramenImage),
                            fit: BoxFit.cover,
                          )),
                      child: InkWell(
                        splashColor: const Color.fromARGB(119, 255, 184, 77),
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30)),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return StoreDataBottomSheet(store: store);
                              });
                          storeRepository.setStore(store: store.deleteCheck());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  height: 250.0.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: !store.isAddCheck
                              ? Text(
                                  "new",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 251, 1, 159),
                                      fontSize: 20.0.sp),
                                )
                              : null,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomLeft,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color.fromARGB(173, 48, 46, 46),
                              ),
                              child: Text(
                                store.name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0.sp),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color.fromARGB(224, 48, 46, 46),
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    !store.isFavorite
                                        ? storeRepository.setStore(
                                            store: store.addFavorite())
                                        : storeRepository.setStore(
                                            store: store.deleteFavorite());
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(!store.isFavorite
                                            ? SnackBar(
                                                content: Text(
                                                  "${store.name}を\nお気に入りに登録しました！",
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        219, 209, 67, 186),
                                                duration:
                                                    const Duration(seconds: 1),
                                              )
                                            : SnackBar(
                                                content: Text(
                                                  "${store.name}を\nお気に入りから削除しました。",
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        219, 67, 209, 140),
                                                duration:
                                                    const Duration(seconds: 1),
                                              ));
                                  },
                                  icon: !store.isFavorite
                                      ? const Icon(
                                          Icons.favorite_outline,
                                          size: 20.0,
                                        )
                                      : ShaderMask(
                                          shaderCallback: (Rect rect) {
                                            return const LinearGradient(
                                              colors: [
                                                Color.fromARGB(
                                                    255, 250, 36, 107),
                                                Color.fromARGB(
                                                    255, 245, 68, 127),
                                                Color.fromARGB(
                                                    255, 243, 126, 165),
                                              ],
                                            ).createShader(rect);
                                          },
                                          child: const Icon(
                                            Icons.favorite_outline,
                                            size: 20.0,
                                            color: Colors.white,
                                          ),
                                        )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
