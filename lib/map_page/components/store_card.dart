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
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 100.0,
                foregroundImage: NetworkImage(store!.ramenImage),
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
