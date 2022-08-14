import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/store_list_page/components/store_data.dart';
import 'package:ramen_map_app/store_list_page/store_list_controller.dart';

class StoreListPage extends ConsumerWidget {
  const StoreListPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeListController = ref.watch(storeListProvider);
    return Scaffold(
      appBar: const BaseAppBar(
        title: Text(
          "一覧",
          style: TextStyle(color: Colors.white),
        ),
        widgets: [],
        color: Colors.orange,
      ),
      body: Center(
          child: FirestoreListView<Store>(
        query: storeListController.storeQuery(),
        itemBuilder: (context, snapshot) {
          final store = snapshot.data();
          return StoreData(store: store);
        },
      )),
    );
  }
}
