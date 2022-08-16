import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/store_list_page/components/area_dialog.dart';
import 'package:ramen_map_app/store_list_page/components/store_data.dart';
import 'package:ramen_map_app/store_list_page/store_list_controller.dart';

class StoreListPage extends ConsumerWidget {
  const StoreListPage({Key? key, required this.taste}) : super(key: key);
  final String taste;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeListController = ref.watch(storeListProvider);

    return Scaffold(
      appBar: BaseAppBar(
        title: const Text(
          "お店一覧",
          style: TextStyle(color: Colors.white),
        ),
        widgets: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
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
        color: Colors.orange,
      ),
      body: Center(
          child: FirestoreListView<Store>(
        query: storeListController.storeQuery(taste),
        itemBuilder: (context, snapshot) {
          final store = snapshot.data();
          return StoreData(store: store);
        },
      )),
    );
  }
}
