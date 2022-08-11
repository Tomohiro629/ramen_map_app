import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/repository/store_repository.dart';

final setStoreControllerProvider =
    ChangeNotifierProvider<SetStoreController>((ref) {
  return SetStoreController(ref.read);
});

class SetStoreController extends ChangeNotifier {
  final Reader _reader;
  SetStoreController(this._reader);

  Future<void> setStore({
    required String name,
    required String price,
    required String memo,
    required double latitude,
    required double longitude,
  }) async {
    final store = Store.create(
        name: name,
        price: price,
        memo: memo,
        latitude: latitude,
        longitude: longitude);
    await _reader(storeRepositoryProvider).setStore(store: store);
  }
}