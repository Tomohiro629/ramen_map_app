import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/repository/store_repository.dart';

class StoreCard extends ConsumerWidget {
  const StoreCard({Key? key, required this.storeId}) : super(key: key);
  final String storeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeRepository = ref.watch(storeRepositoryProvider);

    return StreamBuilder<Store?>(
      stream: storeRepository.getStore(storeId: storeId),
      builder: ((context, snapshot) {
        final store = snapshot.data;
        if (snapshot.hasData) {
          return Stack(
            children: [
              InkWell(
                onTap: () {
                  //moveCamera
                },
                child: Stack(children: [
                  CircleAvatar(
                    radius: 200.0,
                    foregroundImage: NetworkImage(store!.ramenImage),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 150.0,
                        height: 25.0,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(147, 45, 39, 39),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Center(
                          child: Text(
                            store.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.orange[700], fontSize: 12.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          );
        }
        if (snapshot.hasError) {
          return const Text("エラー");
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
