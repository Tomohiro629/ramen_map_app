import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/map_page/map_controller.dart';
import 'package:ramen_map_app/repository/store_repository.dart';
import 'package:ramen_map_app/service/auth_service.dart';
import 'package:ramen_map_app/store_list_page/components/area_dialog.dart';
import 'package:ramen_map_app/store_list_page/components/store_distance_button.dart';
import 'package:ramen_map_app/store_list_page/components/store_image.dart';

class StoreListPage extends ConsumerWidget {
  const StoreListPage({
    Key? key,
    required this.taste,
  }) : super(key: key);
  final String taste;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeListController = ref.watch(storeRepositoryProvider);
    final currentPosition = ref.watch(mapControllerProvider).initialPosition;
    final userId = ref.watch(authServiceProvider).userId;

    return Scaffold(
      appBar: BaseAppBar(
        title: const Text(
          "お店一覧",
          style: TextStyle(color: Colors.white),
        ),
        widgets: [
          taste.isEmpty
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: IconButton(
                    icon: const Icon(Icons.manage_search_outlined),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AreaDialog(taste: taste);
                          });
                    },
                  ),
                ),
        ],
        color: const LinearGradient(
            colors: [Colors.red, Colors.deepOrange, Colors.orangeAccent]),
      ),
      body: Center(
        child: taste.isEmpty
            ? Stack(
                children: [
                  FirestoreListView<Store>(
                    query: storeListController.queryStore(userId: userId),
                    itemBuilder: (context, snapshot) {
                      final store = snapshot.data();
                      return StoreImage(
                          store: store, currentPosition: currentPosition!);
                    },
                  ),
                  const StoreDistaceButton(),
                ],
              )
            : FirestoreListView<Store>(
                query: storeListController.queryTasteStore(
                    taste: taste, userId: userId),
                itemBuilder: (context, snapshot) {
                  final store = snapshot.data();
                  return StoreImage(
                    store: store,
                    currentPosition: const LatLng(0.0, 0.0),
                  );
                },
              ),
      ),
    );
  }
}
