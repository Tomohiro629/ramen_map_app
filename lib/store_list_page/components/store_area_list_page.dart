import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/repository/store_repository.dart';
import 'package:ramen_map_app/store_list_page/components/store_data.dart';

class StoreAreaListPage extends ConsumerWidget {
  const StoreAreaListPage({Key? key, required this.taste, required this.area})
      : super(key: key);
  final String taste;
  final String area;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeRepository = ref.watch(storeRepositoryProvider);

    return Scaffold(
      appBar: const BaseAppBar(
        title: Text(
          "エリア検索",
          style: TextStyle(color: Colors.white),
        ),
        widgets: [],
        color: Colors.orange,
      ),
      body: Center(
          child: FirestoreListView<Store>(
        query: storeRepository.queryAreaStore(taste: taste, area: area),
        itemBuilder: (context, snapshot) {
          final store = snapshot.data();
          return StoreData(store: store);
        },
      )),
    );
  }
}