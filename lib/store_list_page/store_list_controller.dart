import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/repository/store_repository.dart';

final storeListProvider = ChangeNotifierProvider<StoreListController>((ref) {
  return StoreListController(ref.read);
});

class StoreListController extends ChangeNotifier {
  final Reader reader;
  StoreListController(this.reader);

  Future<void> deleteStore(String storeId) async {
    reader(storeRepositoryProvider).deleteStore(storeId);
  }

  Query<Store> storeQuery() {
    return reader(storeRepositoryProvider).queryStore();
  }
}
