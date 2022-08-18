import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/favorite_page/favorite_controller.dart';
import 'package:ramen_map_app/store_list_page/components/store_data.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteController = ref.watch(favoriteProvider);
    return Scaffold(
      appBar: const BaseAppBar(
        title: Text(
          "お気に入り",
          style: TextStyle(color: Colors.white),
        ),
        widgets: [],
        color: LinearGradient(
            colors: [Colors.red, Colors.deepOrange, Colors.orangeAccent]),
      ),
      body: Center(
        child: FirestoreListView<Store>(
          query: favoriteController.favoriteQuery(),
          itemBuilder: (context, snapshot) {
            final store = snapshot.data();
            return StoreData(store: store);
          },
        ),
      ),
    );
  }
}
