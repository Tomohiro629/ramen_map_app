import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/repository/store_repository.dart';
import 'package:ramen_map_app/service/auth_service.dart';
import 'package:ramen_map_app/store_list_page/components/store_image.dart';

class StoreLimitPage extends ConsumerWidget {
  const StoreLimitPage({Key? key, required this.number}) : super(key: key);
  final int number;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeRepository = ref.watch(storeRepositoryProvider);

    return Scaffold(
      appBar: const BaseAppBar(
        title: Text(
          "近い順",
          style: TextStyle(color: Colors.white),
        ),
        widgets: [],
        color: LinearGradient(
            colors: [Colors.red, Colors.deepOrange, Colors.orangeAccent]),
      ),
      body: Center(
          child: FirestoreListView<Store>(
        query: storeRepository.queryDistanceStore(
            userId: ref.watch(authServiceProvider).userId),
        itemBuilder: (context, snapshot) {
          final store = snapshot.data();
          return StoreImage(
            store: store,
            currentPosition: LatLng(store.latitude, store.longitude),
          );
        },
      )),
    );
  }
}
